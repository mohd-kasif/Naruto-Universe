//
//  SearchCharView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 07/06/24.
//

import SwiftUI

struct SearchCharView: View {
    @ObservedObject var vm=SearchCharViewModel()
    @State var text:String=""
    var body: some View {
        VStack(alignment:.center){
            HStack{
                TextField("Enter Character Name", text: $text)
                    .onChange(of: text){val in
                        text=val.uppercased()
                        
                        if text.count>2{
                            print(text,"search character")
                            vm.searchInfo(text: text)
                        }
                    }
                    .padding()
            }
            .frame(maxWidth:.infinity)
            .frame(height:52)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1).foregroundColor(.secondary))
            ScrollView(){
                switch vm.loadingState {
                case .isloading:
                    ProgressView()
                        .frame(width: 200,height: 200)
                case .fetched:
                    if let searchChar=vm.serachChar?.characters{
                        LazyVStack(spacing:5){
                            ForEach(searchChar, id: \.id){item in
                                SingleCharacterView(name: item.name, url: item.images.isEmpty ? "" : item.images[0])
                                    .cardStyle()
                            }
                        }
                    }
                case .idle:
                    EmptyView()
                case .error:
                    Text("error occured")
                }
            }
         
        }
        .padding([.leading,.trailing],20)
            .navBar(title: "Search", backBtnAllow: true, backButton: {
                Router.shared.goBack()
            })
    }
}

#Preview {
    SearchCharView()
}
