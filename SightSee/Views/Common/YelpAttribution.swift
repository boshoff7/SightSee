//
//  YelpAttribution.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/18.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link: String
    
    var body: some View {
        
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
    }
}

//struct YelpAttribution_Previews: PreviewProvider {
//    static var previews: some View {
//        YelpAttribution(link: <#T##String#>)
//    }
//}
