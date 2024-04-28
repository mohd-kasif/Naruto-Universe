//
//  CharacterView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 21/04/24.
//

import SwiftUI

struct CharacterView: View {
    var charInfo:Characters
    init(charInfo: Characters) {
        self.charInfo = charInfo
        print(self.charInfo,"char info")
    }
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navBar(title: charInfo.name, backBtnAllow: true, backButton: {
            Router.shared.goBack()
        })

    }
}

//#Preview {
//    CharacterView()
//}
