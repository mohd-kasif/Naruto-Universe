//
//  SearchCharViewModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 07/06/24.
//

import Foundation
enum LoadingState{
    case isloading
    case fetched
    case idle
    case error
}
class SearchCharViewModel:NetworkManager,ObservableObject{
     @Published var serachChar:SearchChar?
     @Published var text:String=""
     @Published var loadingState:LoadingState = .idle
    func searchInfo(text:String){
        self.loadingState = .isloading
        let url=AllUrl.serachChar+"\(text)"
        request(url: url, type: SearchChar.self){[weak self] response, error in
            guard let self=self else {return}
            DispatchQueue.main.async {
                if error == nil{
                    self.serachChar=response
                    self.loadingState = .fetched
                    print(self.serachChar as Any,"fetched data")
                } else {
                    self.loadingState = .error
                    print(error as Any, "Error from API")
                }
            }
        }
    }
}
