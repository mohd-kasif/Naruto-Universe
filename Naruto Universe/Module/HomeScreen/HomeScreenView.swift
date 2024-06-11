//
//  HomeScreenView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 10/06/24.
//

import SwiftUI
enum HomeRouter:String{
    case characters,clan,village,kekke,tailed,teams,akatsuki,kara
}
struct HomeScreenView: View {
    var array:[HomeModel]=[
        HomeModel(imageName: .characters, title: "Characters"),
        HomeModel(imageName: .clan, title: "clan"),
        HomeModel(imageName: .village, title: "village"),
        HomeModel(imageName: .kekke, title: "Kekkei-Genkai"),
        HomeModel(imageName: .tailed, title: "Tailed-Beasts"),
        HomeModel(imageName: .teams, title: "Teams"),
        HomeModel(imageName: .akatsuki, title: "Akatsuki"),
        HomeModel(imageName: .kara, title: "Kara"),
    ]
    
    func route(item:HomeRouter){
        switch item{
        case .characters:
            Router.shared.pushNextScreen(view: AllCharacterView(), viewName: String(describing: AllCharacterView.self))
        case .clan:
            Router.shared.pushNextScreen(view: ClanView(), viewName: String(describing: ClanView.self))
        case .village:
            Router.shared.pushNextScreen(view: VillageView(), viewName: String(describing: VillageView.self))
        case .kekke:
            Router.shared.pushNextScreen(view: KekkeView(), viewName: String(describing: KekkeView.self))
        case .tailed:
            return
        case .teams:
            Router.shared.pushNextScreen(view: TeamsView(), viewName: String(describing: TeamsView.self))
        case .akatsuki:
            return
        case .kara:
            return
        }
    }
    
    let coloumn=[GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        ZStack{
            Color.color("#FFFAF0").ignoresSafeArea()
            VStack(alignment: .leading){
                NjNarutoText.shared.getH3Text(inputString: "Explore Naruto Universe", withSize: 18)
                LazyVGrid(columns:coloumn){
                    ForEach(array){item in
                        HomeButton(image: item.imageName.rawValue, title: item.title){
                            route(item: item.imageName)
                        }
                            .padding(.top)
                    }
                }
                Spacer()
            }
            .padding([.leading, .trailing],10)
        }
    }
}

#Preview {
    HomeScreenView()
}


struct HomeModel:Identifiable{
    let id=UUID()
    let imageName:HomeRouter
    let title:String
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
