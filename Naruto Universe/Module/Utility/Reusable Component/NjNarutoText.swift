//
//  NjNarutoText.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 24/04/24.
//

import Foundation
import SwiftUI

final class NjNarutoText{
    static let shared=NjNarutoText()
//    let fontFamily="Ninja-Naruto"
    let fontFamily="ReggaeOne-Regular"
    private init(){}
    func getH3Text(inputString:String, withSize:Double, color:Color=Color.color("#000000"))->Text{
        return Text(inputString)
            .font(Font.custom(self.fontFamily, size: withSize))
            .fontWeight(.bold)
            .foregroundStyle(color)
    }
    func getH4Text(inputString:String, withSize:Double, color:Color=Color.color("#000000"))->Text{
        return Text(inputString)
            .font(Font.custom(self.fontFamily, size: withSize))
            .fontWeight(.medium)
            .foregroundStyle(color)
    }
    func getH6Text(inputString:String, withSize:Double, color:Color=Color.color("#000000"))->Text{
        return Text(inputString)
            .font(Font.custom(self.fontFamily, size: withSize))
            .fontWeight(.regular)
            .foregroundStyle(color)
    }
    func getHeadlineText(inputString:String, withSize:Double, color:Color=Color.color("#000000"))->Text{
        return Text(inputString)
            .font(Font.custom(self.fontFamily, size: withSize))
            .fontWeight(.semibold)
            .foregroundStyle(color)
    }
    
}
