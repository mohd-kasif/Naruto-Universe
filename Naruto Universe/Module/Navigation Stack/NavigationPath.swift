//
//  NavigationPath.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 28/04/24.
//

import Foundation
import SwiftUI

struct MyNavigationInfo:Hashable{
    
    var view:AnyView
    var viewName:String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(viewName)
    }
    static func == (lhs: MyNavigationInfo, rhs: MyNavigationInfo) -> Bool {
        lhs.viewName==rhs.viewName
    }
}

class MyNavigationPath:ObservableObject{
    static let shared=MyNavigationPath()
    @Published var pathArray:[MyNavigationInfo]=[]
    @Published var rootView=AnyView(HomeScreenView())
}
