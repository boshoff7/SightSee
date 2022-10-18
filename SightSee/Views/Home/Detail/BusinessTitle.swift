//
//  BusinessTitle.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/18.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            // Business Name
            Text(business.name!)
                .font(.title2)
                .bold()
                
            // Loop through display address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}

