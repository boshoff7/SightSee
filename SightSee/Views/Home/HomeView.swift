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
    @State var selectedBusiness: Business?
    
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
                    ZStack (alignment: .top) {
                        // Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                // Create a business detail view instance
                                // Pass in the selected business
                                BusinessDetail(business: business)
                            }
                        
                        // Rectangle overlay
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                           
                            HStack {
                                Image(systemName: "location")
                                Text("San Francisco")
                                Spacer()
                                Button("List View") {
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
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
