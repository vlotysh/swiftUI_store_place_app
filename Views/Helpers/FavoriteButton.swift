//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Vlad Lotysh on 01.12.2021.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button{
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill": "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
            .previewLayout(.fixed(width: 70, height: 70))
        FavoriteButton(isSet: .constant(true))
            .previewLayout(.fixed(width: 70, height: 70))
    }
}
