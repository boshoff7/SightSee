//
//  OnboardingView.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/18.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let teal = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack {
            
            // Tab View
            TabView(selection: $tabSelection) {
                
                // First Tab
                VStack (spacing: 20){
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Welcome to SightSee")
                        .bold()
                        .font(.title)
                    Text("SightSee helps you find the best of your city")
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
                
                // Second Tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restuarants, venues and more, based on your location")                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            Button {
                
                // Detect which tab it is
                if tabSelection == 0 {
                    tabSelection = 1
                } else {
                    // Request for geolocation permission
                    model.requestGeoLocationPermission()
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Show My Location")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue : teal)
            .padding()
            
            Spacer()
        }
        .background(tabSelection == 0 ? blue : teal)
        .ignoresSafeArea(.all, edges: .all)
    }
        
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
