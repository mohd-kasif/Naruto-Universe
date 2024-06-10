//
//  SearchCharViewModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 07/06/24.
//

import Foundation
import SwiftUI
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
     @Published var images:[UIImage]=[]
    @Published var url=["https://picsum.photos/200","https://picsum.photos/200","https://picsum.photos/200"]
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
    
    func getImages(url:[String]) async throws {
        try await withThrowingTaskGroup(of: UIImage.self){group in
            for i in url{
                group.addTask {
                    try await self.request(url: i)
                }
            }
            
            for try await image in group{
                DispatchQueue.main.async {
                    self.images.append(image)
                }
            }
        }
//        for i in url{
//            do {
//                let image=try await request(url: i)
//                DispatchQueue.main.async {
//                    self.images.append(image)
//                }
//            } catch{
//                print(error)
//            }
//        }
    }
}
