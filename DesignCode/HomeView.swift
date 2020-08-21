//
//  HomeView.swift
//  DesignCode
//
//  Created by Admin on 21/08/20.
//  Copyright © 2020 NucleyaZ. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile : Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                Button(action: {
                    self.showProfile.toggle()
                }) {
                    AvatarView(showProfile: $showProfile)
                }
            }
            .padding(.horizontal)
            .padding(.leading, 16) //to align "watching" text with the ScrollView
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing : 30) {
                    ForEach(sectionData) { item in
                        SectionView(section: item)
                    }
                }
                .padding(30)
                .padding(.bottom, 30) //to compensate for the shadow clipping
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section : Section
    
    var body: some View {
        VStack {
            HStack(alignment : .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                
                Image(section.logo)
            }
            
            Text(section.text)
                .frame(maxWidth : .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width : 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section : Identifiable {
    var id = UUID()
    var title : String
    var text : String
    var logo : String
    var image : Image
    var color : Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.3647058824, green: 0.06666666667, blue: 0.968627451, alpha: 1))),
    Section(title: "Build a SwiftUI App", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
    Section(title: "SwiftUI Advanced", text: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))

    ]
