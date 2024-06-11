//
//  HomeButton.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 10/06/24.
//

import SwiftUI

struct HomeButton: View {
    var image:String
    var title:String
    var onTap:(()->Void)?
    init(image: String, title: String, onTap: (()->Void)?=nil) {
        self.image = image
        self.title = title
        self.onTap = onTap
    }
    var body: some View {
                Button{
                    onTap?()
                } label: {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: (UIScreen.screenWidth/2)-15,height:140)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                        .overlay(
                            ZStack(alignment: .center){
                                VStack{
                                    
                                }
                                .frame(width: (UIScreen.screenWidth/2)-15,height: 30)
                                .background(.black)
                                .opacity(0.5)
                                .blur(radius: 3)
                                .frame(maxWidth:.infinity, maxHeight: 140, alignment: .bottom)
                                
                                NjNarutoText.shared.getH6Text(inputString: title, withSize: 18,color: Color.color("#FFFFFF"))
                                    .frame(maxWidth: .infinity, maxHeight: 140.0, alignment: .bottom)
                                    .opacity(0.9)
                            }
//                            NjNarutoText.shared.getH6Text(inputString: title, withSize: 18,color: Color.color("#FF5733"))

                                
                        )
                }
                .buttonStyle(GrowingButton())
    }
}

#Preview {
    HomeButton(image: "kara",title: "kashif")
}

//kara:     #e1db4f
//villages: #0b0b0b
//team :
