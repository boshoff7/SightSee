//
//  DirectionsView.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/18.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            
            HStack {
                // Business Title
                BusinessTitle(business: business)
                Spacer()
                
                if let lat  = business.coordinates?.latitude,
                   let long = business.coordinates?.longitude,
                   let name = business.name {
                    Link("Open in Maps", destination: URL(string: "https://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                }
            }
            .padding()
                        
            // Direction map view
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

