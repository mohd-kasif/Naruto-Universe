//
//  AllCharacterView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 24/04/24.
//

import SwiftUI

struct AllCharacterView: View {
    
    @ObservedObject var vm=AllCharacterViewModel()
    
    init() {
        self.vm = vm
        vm.getAllCharacter(page: vm.page)
    }
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
                                    .onTapGesture {
//                                        print(item, "item info")
                                        Router.shared.pushNextScreen(view: CharacterView(charInfo: item), viewName: String(describing: CharacterView.self))
                                    }
                                    .onAppear{
                                        if item==vm.allCharacter?.characters.last{
                                            appendCharacter()
                                        }
                                    }
                            }
                        }
                    } else {
                        EmptyView()
                    }
               
                }
            }
            .navBar(title: "Characters",backButton: {
            })
            .padding([.trailing,.leading],20)
            
        }
        
    }
}

extension AllCharacterView{
    func appendCharacter(){
        vm.page += 1
        vm.getAllCharacter(page: vm.page)
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
