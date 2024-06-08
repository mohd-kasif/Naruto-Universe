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
            Color.color("#FFFFFF")
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    if let allCharacter = vm.allCharacter?.characters{
                        LazyVStack(spacing: 5){
                            ForEach(allCharacter, id:\.id){item in
                                SingleCharacterView(name: item.name, url: item.images.isEmpty ? "" : item.images[0])
                                    .cardStyle()
                                    .onTapGesture {
                                        //                                        print(item, "item info")
                                        //                                        Router.shared.pushNextScreen(view: VideoPlayerView(), viewName: String(describing: VideoPlayerView.self))
                                        Router.shared.pushNextScreen(view: CharacterView(charInfo: item), viewName: String(describing: CharacterView.self))
                                    }
                                    .onAppear{
//                                        if item==vm.allCharacter?.characters.last{
//                                            appendCharacter()
//                                        }
                                    }
                            }
                        }
                    } else {
                        EmptyView()
                    }
                    
                
            }
            }
            .navBar(title: "Characters",searchBtn: true, backButton: {
            }, searchButton: {
                Router.shared.pushNextScreen(view: SearchCharView(), viewName: String(describing: SearchCharView.self))
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
            .background(Color.color("#FFFFFF"))
            .cornerRadius(8)
            .shadow(radius: 8)
            .padding()
    }
}

//struct SingleCharModifier:ViewModifier{
//    func body(content: Content) -> some View {
//        content
//            .background(Color.color("#59180B"))
//        
//    }
//}
