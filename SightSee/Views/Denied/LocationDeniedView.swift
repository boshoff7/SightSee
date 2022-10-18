//
//  LocationDeniedView.swift
//  SightSee
//
//  Created by Chris Boshoff on 2022/10/18.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        
        VStack (spacing: 20){
            
            Spacer()
            
            Text("Whoops!")
                .font(.title)
            
            Text("We need to access your location to provide you with the best sights in the city. You can change your decision at any time in Settings")
            
            Spacer()
            
            Button {
                // Open settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        // If we can open the settings url, then open it
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                
            } label: {
                ZStack {
                    Rectangle()
                        .cornerRadius(10)
                        .frame(height: 48)
                        .foregroundColor(.white)
                    
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                        .padding()
                }
            }
            .padding()
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
