//
//  EmbedLocationDetailsView.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 4/11/23.
//

import SwiftUI

struct EmbedLocationDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    
    var iconTitle: String
    var subTitle: String
    
    init(iconTitle: String, subTitle: String) {
        
        self.iconTitle = iconTitle
        self.subTitle = subTitle
    }
    
    var body: some View {
        
        HStack(){
            Text(iconTitle)
                .font(.footnote).frame(alignment: .leading).foregroundColor(Color.lightBlue).bold()
            Text(subTitle)
                .font(.footnote).frame(alignment: .trailing)
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .onDisappear {
            // Navigate backward when the view disappears
            dismiss()
        }
        
    }
}

struct OtherDetailItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EmbedLocationDetailsView(iconTitle: "😀 Planet", subTitle: "Venus")
    }
}
