//
//  Router.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 28/04/24.
//

import Foundation
import SwiftUI
class Router{
    static let shared=Router()
    @Published var navigationPath=MyNavigationPath.shared
    
    
    func moveToHome(){
        navigationPath.rootView=AnyView(AllCharacterView())
    }
    
    func pushNextScreen(view: any View, viewName:String){
        navigationPath.pathArray.append(MyNavigationInfo(view: AnyView(view), viewName: viewName))
    }
    func goBack(){
        if !navigationPath.pathArray.isEmpty{
            navigationPath.pathArray.removeLast()
        }
    }
}
