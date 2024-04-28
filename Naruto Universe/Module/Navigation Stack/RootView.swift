//
//  RootView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 28/04/24.
//

import Foundation
import SwiftUI
struct MyRootView:View{
    @ObservedObject var navigationPath=MyNavigationPath.shared
    var body: some View{
        NavigationStack(path: $navigationPath.pathArray){
            navigationPath.rootView
                .navigationDestination(for: MyNavigationInfo.self){item in
                    item.view
                }
        }
    }
}
