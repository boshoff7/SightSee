//
//  HomeView.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/17.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restuarants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                if !isMapShowing {
                    // Show list
                    
                    VStack {
                        HStack {
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Map View") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        
                        BusinessList()
                    }.padding([.horizontal, .top])
                    
                } else {
                    // Show map
                    BusinessMap()
                        .ignoresSafeArea()
                }
            }
        } else {
            // Show spinner
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
