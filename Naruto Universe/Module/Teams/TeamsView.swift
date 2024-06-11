//
//  TeamsView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import SwiftUI

struct TeamsView: View {
    @ObservedObject var vm=TeamsViewModel()
    @State var page=1
    let coloumn=[GridItem(.flexible()),GridItem(.flexible())]
    init(){
        self.vm=vm
        vm.getTeams(page: page)
    }
    
    func appendData(){
        page += 1
        vm.getTeams(page: page)
        
    }
    var body: some View {
        ZStack{
            Color.color("#FFFAF0").ignoresSafeArea()
            ScrollView{
            LazyVGrid(columns: coloumn){
                if let teams = vm.teams?.teams{
                    ForEach(teams, id: \.self){item in
                        LazyVStack{
                            NjNarutoText.shared.getH6Text(inputString: item.name, withSize: 18)
                        }
                        .frame(width: UIScreen.width/3,height: 100)
                        .cardStyle()
                        .onAppear{
                            if item==teams.last{
                                appendData()
                            }
                        }
                    }
                }
               
            }
        }
            
        }
        .navBar(title: "Teams",backBtnAllow: true,searchBtn: true, backButton: {
            Router.shared.goBack()
        },searchButton: {
            
        })
    }
}

#Preview {
    TeamsView()
}
