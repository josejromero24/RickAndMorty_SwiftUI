//
//  CharactersView.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//
import SwiftUI

struct CharactersView: View {
    @ObservedObject var presenter: CharactersPresenter
    @State private var searchText: String = ""
    
    @State private var parameter: String = ""
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    
    var body: some View {
            
            if presenter.isFirstLoading{
                ProgressView("Loading...")
            } else {
                
                
                    NavigationView {
                        
                        
                        
                VStack(alignment: .center, spacing: 10) {
                    Text(LocalizedStringKey("titleApp"))
                        .font(.system(size: 25, weight: .bold, design: .monospaced))
                        .kerning(3)
                        .foregroundColor(.lightBlueTitle)
                    Spacer()
                    SearchBar(text: $searchText)
                    
                    
                    ScrollView {
                        Spacer()
                        LazyVGrid(columns: columns, spacing: 20) {
                            if presenter.getFilteredItemsByName(searchText: searchText).count <= 0 {
                                CharactersEmptyViewCell()
                            } else {
                                ForEach(presenter.getFilteredItemsByName(searchText: searchText)) { character in
                                    VStack {
                                        
                                       NavigationLink(destination: CharactersDetailsView(presenter: CharactersDetailsPresenter(), characterUrl: character.url ?? "")){
                                            
                                            CharactersViewCell(image: self.presenter.getUrlImageFromCharacter(character: character),
                                                               name: character.name ,
                                                               status: character.status ?? .unknown)
                                            
                                       }
                            
                                        
                                        
                                        
                                    }
                                    .onAppear {
                                        if character == presenter.characters.last {
                                            presenter.fetchCharacters()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .background(Color.lightGrayBg)
                    
                }
                .onTapGesture {
                    // Hide the keyboard when tap anywhere in Scrollview
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                        
                }
                        
                    .gesture(DragGesture().onChanged { _ in print("JJASD DRAG") })
            
                
            .navigationBarHidden(true)
        
            .onAppear {
                presenter.fetchCharacters()
            }
            }
    }
}


struct CharactersView_Previews: PreviewProvider{
    static var previews: some View {
        CharactersView(presenter: CharactersPresenter())
    }
}


