//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Admin on 27/08/20.
//  Copyright © 2020 NucleyaZ. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    @Published var updates : [Update] = updateData
}
