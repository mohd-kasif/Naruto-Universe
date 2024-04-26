//
//  AllCharacterView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 24/04/24.
//

import SwiftUI

struct AllCharacterView: View {
    
    @ObservedObject var vm=AllCharacterViewModel()
    var body: some View {
        
        ZStack{
            Color.color("#8a1e22")
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    if let allCharacter = vm.allCharacter?.characters{
                        LazyVStack{
                            ForEach(allCharacter, id:\.id){item in
                                SingleCharacterView(name: item.name, url: item.images.isEmpty ? "" : item.images[0])
                                    .cardStyle()
                                    .onAppear{
                                        if item==vm.allCharacter?.characters.last{
                                            var newPage=vm.page
                                            newPage += 1
                                            vm.page=newPage
                                            vm.getAllCharacter(page: vm.page)
                                        }
                                    }
                            }
                        }
                    } else {
                        EmptyView()
                    }
               
//                    SingleCharacterView(name: "Obito Uchiha", url: "https://static.wikia.nocookie.net/naruto/images/4/4a/Obito_Uchiha.png")
//                        .cardStyle()
                }
            }
            .padding([.trailing,.leading],20)
            .onAppear{
                vm.getAllCharacter(page: 1)
//                vm.getCharacterInfo()
//                vm.getCharacter(name: "otachi")
            }
        }
        
    }
}

//#Preview {
//    AllCharacterView()
//}

struct CharacterViewModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(Color.color("#59180B"))
            .cornerRadius(8)
            .shadow(radius: 8)
            .padding()
    }
}
