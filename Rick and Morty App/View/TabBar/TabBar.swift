//
//  TabBar.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tabs = Tabs.characters
    
    
    init() {
        tabBarAppearance()
    }
    
    var body: some View {
   
        TabView(selection: $activeTab){
            
            // First Tab
            CharactersView(presenter: CharactersPresenter())
                .tabItem {
                    Label(LocalizedStringKey("characterTab"), systemImage: "person.2")
                }
                .tag(Tabs.characters)
               
            
            //            Second Tab
            LocationsView(presenter: LocationsPresenter())
                .tabItem {
                    Label(LocalizedStringKey("locationTab"), systemImage: "map")
                }
                .tag(Tabs.locations)
            
            //            Third Tab
            EpisodesView(presenter: EpisodesPresenter())
                .tabItem {
                    Label(LocalizedStringKey("episodeTab"), systemImage: "map")
                }
                .tag(Tabs.episodes)
        }
        
        
       
        .accentColor(Color.tabBarSelectedColor)
    }
}

extension TabBar {
    
    func tabBarAppearance() {
        
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = .white
        //UITabBar.appearance().backgroundColor = .clear
        
    }
}

struct TabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        TabBar()
    }
}
