//
//  ClanViewModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation


class ClanViewModel:NetworkManager,ObservableObject{
    @Published var allClan:AllClan?
    
    func getAllClan(page:Int){
        let url=AllUrl.allClan+"\(page)"
        request(url: url, type: AllClan.self) {[weak self] data, error in
            guard let self=self else {return}
            DispatchQueue.main.async {
                if error==nil{
                    if let allClan=data?.clans{
                        if let _ = self.allClan?.clans{
                            self.allClan?.clans.append(contentsOf: allClan)
                            print("appending data")
                        } else {
                            self.allClan=data
                        }
                    }
                } else {
                    print(error?.localizedDescription  as Any,"Error from api")
                }
            }
        }
    }
}
