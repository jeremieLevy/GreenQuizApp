//
//  SearchBarPerso.swift
//  GreenQuiz
//
//  Created by Axel Remy on 19/06/2024.
//

import SwiftUI

struct SearchBarPerso: View {
    @Binding var searchText: String
    @State private var testSearchText: String = ""
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(
                        searchText.isEmpty ?
                        Color.secondary : Color.secondary)
                
                TextField("Rechercher", text: $searchText)
                    .overlay(
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .foregroundColor(.secondary)
                            .offset(x:10)
                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                              searchText = ""
                            }
                        ,alignment: .trailing
                    )
            }
            .padding(8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
            
        }
    }
}


#Preview {
    SearchBarPerso(searchText: .constant(""))
}
