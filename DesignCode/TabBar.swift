//
//  TabBar.swift
//  DesignCode
//
//  Created by Admin on 01/09/20.
//  Copyright © 2020 NucleyaZ. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                
                Image(systemName: "play.circle.fill")
                
                Text("Home")
            }
            
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                
                Text("Certificates")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 11 Pro")
        }
    }
}
