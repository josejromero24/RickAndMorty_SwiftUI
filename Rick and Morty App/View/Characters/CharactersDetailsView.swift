//
//  CharactersDetailsView.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//


import SwiftUI
import Kingfisher



struct CharactersDetailsView: View {
    
    @ObservedObject var presenter: CharactersDetailsPresenter
    @State var characterUrl: String = ""
     var isGestureEnabled = false
    
    
    var body: some View {
       
        VStack {
            /*
             if presenter.isLoading{
             ProgressView("Loading...")
             } else {
             */
            let urlImage = URL(string: presenter.characterDetail.image ?? "")
            
            KFImage(urlImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 70, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 70, style: .continuous).stroke(Color.gray, lineWidth: 2))
                .padding(.top, 10)
            
            if let name = presenter.characterDetail.name {
                Text(name).font(.title)
            }
            
            Divider().frame(minWidth: 240)
            
            VStack(spacing: 20) {
                
                EmbedLocationDetailsView(iconTitle: "⁉️ Gender: ", subTitle: "\(presenter.characterDetail.gender ?? "") ").frame(maxWidth:.infinity)
                
                EmbedLocationDetailsView(iconTitle: "🛸 Species: ", subTitle: "\(presenter.characterDetail.species ?? "") ").frame(maxWidth:.infinity)
                EmbedLocationDetailsView(iconTitle: "💀 Status: ", subTitle: "\(presenter.characterDetail.status ?? "") ").frame(maxWidth:.infinity)
                EmbedLocationDetailsView(iconTitle: "📍 Origin: ", subTitle: "\(presenter.characterDetail.origin?.name ?? "") ").frame(maxWidth:.infinity)
                EmbedLocationDetailsView(iconTitle: "#️⃣ Number of episodes in which it appears: ", subTitle: "\(presenter.characterDetail.episode?.count ?? 0) ").frame(maxWidth:.infinity)
                
                Spacer()
            }
            .padding()
                
        }
        
        .navigationBarTitle("", displayMode: .inline)
        
            .onAppear {
                if !self.characterUrl.isEmpty {
                    presenter.fetchDetailsOfCharacters(characterUrl: self.characterUrl)
                }
            
        }
        
    }
}


struct CharactersDetailsView_Previews: PreviewProvider{
    static var previews: some View {
        CharactersDetailsView(presenter: CharactersDetailsPresenter())
    }
}
