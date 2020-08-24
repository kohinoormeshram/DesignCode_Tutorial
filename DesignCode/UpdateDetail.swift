//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Admin on 24/08/20.
//  Copyright © 2020 NucleyaZ. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    
    var update : Update = updateData[0]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .frame(maxWidth : .infinity)
                    .aspectRatio(contentMode: .fit)
                Text(update.text)
                    .frame(maxWidth : .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
