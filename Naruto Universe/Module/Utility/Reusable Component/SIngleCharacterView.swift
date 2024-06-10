//
//  SIngleCharacterView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 25/04/24.
//

import SwiftUI

struct SingleCharacterView: View {
    
    var name:String
    var url:String
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    var body: some View {
        ZStack{
        VStack(alignment:.leading){
            if let url=URL(string: url){
                CacheImage(url: url){phase in
                    switch phase{
                    case .empty:
                        ProgressView()
                            .frame(width: 200,height: 200)
                    case .success(let image):
                        image.resizable()
                            .frame(width: (UIScreen.width/2)+30,height: UIScreen.height/3)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                        //                            .clipShape(Circle())
                        //                        .aspectRatio(contentMode: .fit)
                        //                        .frame(maxWidth: 40, maxHeight: 40)
                        //                        .background(.white)
                    default:
                        //                    let _ = Logger.info(description: "erorr during caching")
                        let _ = print("error during caching")
                        Color.clear
                            .frame(maxWidth: 40, maxHeight: 40)
                    }
                }
            } else {
                Image("not_found")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            }
        }
        .padding()
            VStack(alignment:.leading){
                NjNarutoText.shared.getH6Text(inputString: name, withSize: 16,color: Color.color("#FFFFFF"))
                Spacer()
            }
            .frame(width: (UIScreen.width)/2+30,height: 40)
            .background(.black)
            .cornerRadius(8, corner: [.bottomLeft,.bottomRight])
            .opacity(0.6)
            .offset(y:124)
//            .offset(y:UIScreen.height/11)
  
         
            
    }
    }
}

#Preview {
    SingleCharacterView(name: "Itachi Uchicha", url: "https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png")
        .cornerRadius(8)
}
