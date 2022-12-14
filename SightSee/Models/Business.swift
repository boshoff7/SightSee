//
//  Business.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id             : String?
    var alias          : String?
    var name           : String?
    var imageURL       : String?
    var isClosed       : Bool?
    var url            : String?
    var reviewCount    : Int?
    var categories     : [Categories]?
    var rating         : Double?
    var coordinates    : Coordinates?
    var transactions   : [String]?
    var price          : String?
    var location       : Location?
    var phone          : String?
    var displayPhone   : String?
    var distance       : Double?
    
    enum CodingKeys: String, CodingKey {
        case imageURL       = "image_url"
        case isClosed       = "is_closed"
        case reviewCount    = "review_count"
        case displayPhone   = "display_phone"
        
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
    }
    
    func getImageData() {
        // Check the Image URl in not nil
        guard imageURL != nil else { return }
        
        // Download the data from the image
        if let url = URL(string: imageURL!) {
            
            // Get session
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if error == nil {
                        // Set the image data
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
    }
}

struct Categories: Decodable {
    var alias   : String?
    var title   : String?
}

struct Coordinates: Decodable {
    var latitude    : Double?
    var longitude   : Double?
}

struct Location: Decodable {
    var address1        : String?
    var address2        : String?
    var address3        : String?
    var city            : String?
    var zipCode         : String?
    var country         : String?
    var state           : String?
    var displayAddress  : [String]?
    
    enum CodingKeys: String, CodingKey {
        case zipCode        = "zip_code"
        case displayAddress = "display_address"
        
        case address1
        case address2
        case address3
        case city
        case country
        case state
    }
}
