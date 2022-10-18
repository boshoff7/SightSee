//
//  BusinessSectionHeader.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }
    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restuarants")
    }
}
