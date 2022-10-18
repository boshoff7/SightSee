//
//  BusinessSection.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section(header: BusinessSectionHeader(title: title)) {
            ForEach(businesses) { business in
                NavigationLink(destination: BusinessDetail(business: business)) {
                    BusinessRow(business: business)
                }
            }
        }
    }
}
