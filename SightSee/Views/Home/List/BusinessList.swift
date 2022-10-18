//
//  BusinessList.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "Restuarants", businesses: model.restuarants)
                
                BusinessSection(title: "Sights", businesses: model.sights)
               
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
