//
//  CharactersViewCell.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import Foundation
import Kingfisher
import SwiftUI

struct CharactersViewCell: View {
    
    
    let imageSize: CGFloat = 100
    let cornerRadius: CGFloat = 50
    var image: URL
    var name: String
    var status: Status
    
    
    init(image: URL, name: String, status: Status) {
        self.image = image
        self.name = name
        self.status = status
    }
    
    var body: some View {
        VStack(alignment: .center) {
            
            KFImage(image)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .padding(.top, 10)
                    
            VStack{
                
                Text(name)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                HStack(alignment: .center, spacing: 0.0) {
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundColor(getColorFromStatus(status: status))
                    Text(status.rawValue.uppercased())
                        .font(.footnote)
                        .frame(minWidth: 70, alignment: .center)
                        .bold()
                }
            }
        }.padding()
    }
    
    
    func getColorFromStatus(status: Status) -> Color{
        
        switch status {
        case .unknown:
            return .gray
        case .alive:
            return .green
        case .dead:
            return .red
        }
        
    }
}

struct CharacterCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        CharactersViewCell(
            
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
            name: "Test Name",
            status: Status(rawValue: Status.unknown.rawValue) ?? .unknown
        )
    }
}
