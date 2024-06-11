//
//  TeamsViewModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 11/06/24.
//

import Foundation


class TeamsViewModel:NetworkManager, ObservableObject{
    
    @Published var teams:AllTeams?
    func getTeams(page:Int){
        let url=AllUrl.teams+"\(page)"
        request(url: url, type: AllTeams.self) { [weak self] data, error in
            guard let self=self else{return}
            DispatchQueue.main.async {
                if error==nil{
                    if let newData=data?.teams{
                        if let _ = self.teams?.teams{
                            self.teams?.teams.append(contentsOf: newData)
                        } else {
                            self.teams=data
                        }
                    }
                }
            }
        }
    }
}
