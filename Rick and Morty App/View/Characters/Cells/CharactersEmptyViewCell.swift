//
//  CharactersEmptyViewCell.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation
import Kingfisher
import SwiftUI

struct CharactersEmptyViewCell: View {
    
    
    var body: some View {
        VStack(alignment: .center) {
            VStack{
                Text(LocalizedStringKey("noResult"))
                    .frame(maxWidth: .infinity)
            }
        }.padding()
    }
}

struct CharactersEmptyViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        CharactersEmptyViewCell()
    }
}
