//
//  VillageView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import SwiftUI

struct VillageView: View {
    @ObservedObject var vm=VillageViewModel()
    let coloumn=[GridItem(.flexible()),GridItem(.flexible())]
    init(){
        self.vm=vm
        vm.getVillages()
    }
    var body: some View {
        ZStack{
            Color.color("#FFFAF0").ignoresSafeArea()
            ScrollView{
            LazyVGrid(columns: coloumn){
                if let villages = vm.villages?.villages{
                    ForEach(villages, id: \.self){item in
                        LazyVStack{
                            NjNarutoText.shared.getH6Text(inputString: item.name, withSize: 18)
                        }
                        .frame(width: UIScreen.width/3,height: 100)
                        .cardStyle()
                        .onAppear{
                        }
                    }
                }
               
            }
        }
            
        }
        .navBar(title: "Clans",backBtnAllow: true,searchBtn: true, backButton: {
            Router.shared.goBack()
        },searchButton: {
            
        })
    }
}

#Preview {
    VillageView()
}
