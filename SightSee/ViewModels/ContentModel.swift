//
//  ContentModel.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var restuarants = [Business]()
    @Published var sights      = [Business]()
    
    override init() {
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
       // Request Permission from the user
        locationManager.requestWhenInUseAuthorization()
        
        // Start geolocating the user, after we get permission
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - Location Manager Delegate Methods
    /// Checks if user has given permission to get ocation
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
       // Update Authorization State property
        authorizationState = locationManager.authorizationStatus
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // We dont have permission
        }
    }
    
    /// Gives us the location of the user
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       // Give us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            // We have a location
            // Stop requesting location after we get it once
            locationManager.stopUpdatingLocation()
            
            // If we have the coordinates of the user send into yelp API
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restuarantsKey, location: userLocation!)
            
        }
    }
    
    // MARK: - Yelp Api Methods
    
    func getBusinesses(category: String, location: CLLocation) {
        
        // Create URL
        var urlComponents = URLComponents(string: Constants.apiURL)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        let url = urlComponents?.url
        
        if let url = url {
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue(Constants.apiKey, forHTTPHeaderField: "Authorization")
            
            // Get URLSession
            let session = URLSession.shared
            
            // Create Data Task
            let dataTask = session.dataTask(with: request) { data, response, error in
                // Check that is not an error
                if error == nil {
                    
                    // Parse JSON
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        // Sort Businesses
                        var businesses = result.businesses
                        businesses.sort { b1, b2 in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        // Call get image function f the businesses
                        for b in businesses{
                            b.getImageData()
                        }
                        
                        DispatchQueue.main.async {
                            // Assign result to appropriate property
                            switch category {
                            case Constants.sightsKey:
                                self.sights = businesses
                            case Constants.restuarantsKey:
                                self.restuarants = businesses
                            default:
                                break
                            }
                        }
                      
                    } catch {
                        print(error)
                    }
                }
            }
            // Start Data Task
            dataTask.resume()
        }
    }
}
