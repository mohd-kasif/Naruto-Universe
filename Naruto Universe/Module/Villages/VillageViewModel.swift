//
//  VillageViewModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation

class VillageViewModel:NetworkManager,ObservableObject{
    @Published var villages:AllVillages?
    
    func getVillages(){
        let url=AllUrl.allVillage
        request(url: url, type: AllVillages.self) { [weak self] data, error in
            guard let self=self else {return}
            DispatchQueue.main.async {
                if error==nil{
                    self.villages=data
                } else {
                    print(error?.localizedDescription as Any, "erorr from api")
                }
            }
        }
    }
}
