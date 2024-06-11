//
//  KekkeView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import SwiftUI

struct KekkeView: View {
    @ObservedObject var vm=KekkeViewModel()
    @State var page=1
    let coloumn=[GridItem(.flexible()),GridItem(.flexible())]
    init(){
        self.vm=vm
        vm.getKekkeGenkai(page: page)
    }
    func appendData(){
        page += 1
        vm.getKekkeGenkai(page: page)
    }
    var body: some View {
        ZStack{
            Color.color("#FFFAF0").ignoresSafeArea()
            ScrollView{
            LazyVGrid(columns: coloumn){
                if let kekke = vm.kekke?.kekkeiGenkai{
                    ForEach(kekke, id: \.self){item in
                        LazyVStack{
                            NjNarutoText.shared.getH6Text(inputString: item.name, withSize: 18)
                        }
                        .frame(width: UIScreen.width/3,height: 100)
                        .cardStyle()
                        .onAppear{
                            if item==kekke.last{
                                appendData()
                            }
                        }
                    }
                }
               
            }
        }
            
        }
        .navBar(title: "Kekkei-Genkai",backBtnAllow: true,searchBtn: true, backButton: {
            Router.shared.goBack()
        },searchButton: {
            
        })
    }
}

#Preview {
    KekkeView()
}
