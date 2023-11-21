//
//  SearchBar.swift
//  Rick and Morty App
//
//  Created by José Javier Romero on 3/11/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField(LocalizedStringKey("searchCharacter"), text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 15)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
                .transition(.scale)
            }
        }
    }
}
