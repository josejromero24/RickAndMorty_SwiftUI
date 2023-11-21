//
//  LocationsViewCell.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation
import SwiftUI

struct LocationsViewCell: View {
    var name: String
    var type: String
    var dimension: String
    
    init(name: String, type: String, dimension: String) {
        self.name = name
        self.type = type
        self.dimension = dimension
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name:**  \(self.name)").frame(minWidth: 300, alignment: .leading)
            Text("**Type:**  \(self.type)").frame(minWidth: 300, alignment: .leading)
            Text("**Dimension:**  \(self.dimension)").frame(minWidth: 300, alignment: .leading)
        }.padding()
    }
    
    
}

struct LocationsViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        LocationsViewCell(name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137")
    }
}
