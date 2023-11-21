//
//  LocationsResidentsDetails.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import SwiftUI
import Kingfisher

struct LocationsResidentsDetails: View {
    var image: String
    var name: String
    var bornIn: String
    
    init(image: String, name: String, bornIn: String) {
        
        self.image = image
        self.name = name
        self.bornIn = bornIn
    }
    
    var body: some View {
        
        HStack{
            var urlImage = URL(string: self.image)!
            
            KFImage(urlImage)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50, maxHeight: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .padding(.top, 10)
            
            Text(name)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Name:").bold()
                Text("\(name)")
                Divider().frame(maxWidth: 20)
                Text("Born in:").bold()
                Text("\(bornIn)")
            }
            .font(.footnote)
        }
    }
}

struct LocationsResidentsDetails_Previews: PreviewProvider {
    
    static var previews: some View {
    
        LocationsResidentsDetails(image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", name: "Rick Sanchez", bornIn: "Earth (C-137)")
    }
    
}

