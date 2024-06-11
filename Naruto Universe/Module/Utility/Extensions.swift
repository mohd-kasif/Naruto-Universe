//
//  Extensions.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 24/04/24.
//

import Foundation
import SwiftUI
import UIKit
extension Color{
    init(hex:Int, opacity:Double=1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    static func color(_ hex: String, opacity:Double=1.0)->Color{
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        return Color(
            .sRGB,
            red: Double((rgb >> 16) & 0xFF) / 255.0,
            green: Double((rgb >> 8) & 0xFF) / 255.0,
            blue: Double(rgb & 0xFF) / 255.0,
            opacity: opacity
        )
    }
}

extension View{
    func cardStyle()->some View{
        modifier(CharacterViewModifier())
    }
}


extension View{
    public func navBar(title:String,backBtnAllow:Bool?=nil,searchBtn:Bool=false, backButton:@escaping ()->Void,searchButton: (()->Void)?=nil)-> some View{
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .alignmentGuide(HorizontalAlignment.leading, computeValue: { d in
                return d[HorizontalAlignment.leading]+d.width/3.0-(d[explicit: VerticalAlignment.top] ?? 0)
            })
//            .navigationBarItems(leading: BackButtonView)
            .toolbarRole(.navigationStack)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    if let backBtnAllow=backBtnAllow{
                        if backBtnAllow{
                            BackButtonView(onTap: backButton)
                        }
                    }
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    if searchBtn{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .renderingMode(.original)
                            .onTapGesture {
                                if let closure=searchButton{
                                    closure()
                                }
                            }
                    }
                   
                })
                
            })
            .toolbarBackground(Color.color("#FFFFFF"), for: .navigationBar)
    }
}

struct BackButtonView:View{
    var onTap:(()->Void)
    init(onTap: @escaping () -> Void) {
        self.onTap = onTap
    }
    var body: some View {
        Button(action:{
            onTap()
        }){
           Image(systemName: "arrow.backward")
                .resizable()
                .renderingMode(.original)
                .foregroundColor(.black)
        }
    }
}

struct NavBarContent<Content>:View where Content:View{
    
    var leftContent:()-> Content?
    var rightContent:()-> Content?
    var onTap:(()->Void)?
    
    init(@ViewBuilder leftContent: @escaping () -> Content?={nil},@ViewBuilder rightContent: @escaping () -> Content?={nil}, onTap:(()->Void)?=nil) {
        self.leftContent = leftContent
        self.rightContent = rightContent
        self.onTap=onTap
    }
    
    var body: some View{
        leftContent()
        rightContent()
    }
}


extension UIScreen{
    static let width=UIScreen.main.bounds.width
    static let height=UIScreen.main.bounds.height
    static let size=UIScreen.main.bounds.size
}


extension View{
    func cornerRadius(_ radius:CGFloat, corner:UIRectCorner)->some View{
        clipShape(RoundedCorner(radius: radius, corner: corner))
    }
}

struct RoundedCorner:Shape{
    var radius:CGFloat = .infinity
    var corner:UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension HorizontalAlignment{
    
}
