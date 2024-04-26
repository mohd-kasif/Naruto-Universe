//
//  CharacterVIewModel.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 21/04/24.
//

import Foundation

class CharacterVIewModel{
    static let shared=CharacterVIewModel()
    private init(){}
    @Published var characer:CharcterInfo?
    func getCharacter(name:String){
//        let url=URL(string: BaseUrl.baseUrl+Api.characterName+name)!
//        print(url,"url")
//        var request=URLRequest(url: url)
//        request.httpMethod = HttpMethod.Get.rawValue
//        
//        let dataTask=URLSession.shared.dataTask(with: request){(data, response, error) in
////            guard let error = error else {
////                print(error as Any,"Error fetching data")
////                return
////            }
//            guard let response = response as? HTTPURLResponse else {
//                return
//            }
//            
//            if response.statusCode==200{
//                guard let data=data else {return}
//                DispatchQueue.main.async { [self] in
//                    do {
//                        let decodedData=try JSONDecoder().decode(CharcterInfo.self, from: data)
//                        self.characer=decodedData
//                        print(self.characer as Any,"charcter info")
//                    } catch let error {
//                        print(error)
//                    }
//                }
//            } else {
//                print(response.statusCode,"staus code")
//            }
//        }
//        dataTask.resume()
    }
}


