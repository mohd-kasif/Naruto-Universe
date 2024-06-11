//
//  KekkeViewModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation

class KekkeViewModel:NetworkManager,ObservableObject{
    
    @Published var kekke:Kekke?
    
    func getKekkeGenkai(page:Int){
        let url=AllUrl.kekkeGenkai+"\(page)"
        request(url: url, type: Kekke.self) { [weak self] data, error  in
            guard let self=self else {return}
            DispatchQueue.main.async {
                if error==nil{
                    if let newData=data?.kekkeiGenkai{
                        if let _ = self.kekke?.kekkeiGenkai{
                            self.kekke?.kekkeiGenkai.append(contentsOf: newData)
                        } else {
                            self.kekke=data
                        }
                    }
                }
            }
        }
    }
}
