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
        VStack(alignment:.leading){
            if let url=URL(string: url){
                CacheImage(url: url){phase in
                    switch phase{
                    case .empty:
                        ProgressView()
                            .frame(width: 160,height: 200)
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                            .clipShape(Circle())
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

            NjNarutoText.shared.getH6Text(inputString: name, withSize: 16,color: Color.color("#FFFFFFF"))
        }
        .padding()
    }
}

//#Preview {
//    SIngleCharacterView()
//}
