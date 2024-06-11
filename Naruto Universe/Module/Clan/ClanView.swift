//
//  ClanView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import SwiftUI

struct ClanView: View {
    let coloumn=[GridItem(.flexible()),GridItem(.flexible())]
    @ObservedObject var vm=ClanViewModel()
    @State var page=1
    init(){
        self.vm=vm
        vm.getAllClan(page: page)
    }
    
    func appendClan(){
        page += 1
        vm.getAllClan(page: page)
    }
    var body: some View {
        ZStack{
            Color.color("#FFFAF0").ignoresSafeArea()
            ScrollView{
            LazyVGrid(columns: coloumn){
                if let clans=vm.allClan?.clans{
                    ForEach(clans, id: \.self){item in
                        LazyVStack{
                            NjNarutoText.shared.getH6Text(inputString: item.name, withSize: 18)
                        }
                        .frame(width: UIScreen.width/3,height: 100)
                        .cardStyle()
                        .onAppear{
                            if item==clans.last{
                                appendClan()
                            }
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
    ClanView()
}
