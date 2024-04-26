//
//  AllCharacterViewModle.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 24/04/24.
//

import Foundation

class AllCharacterViewModel:NetworkManager,ObservableObject{
    
    @Published var allCharacter:AllCharacter?
    @Published var characer:CharcterInfo?
    @Published var page=1
    
    func getAllCharacter(page:Int){
        let url=AllUrl.page+"\(page)"
        
        request(url: url, type: AllCharacter.self){[weak self] responseData, error in
            guard let self=self else {return}
            DispatchQueue.main.async {
                if error==nil{
                    
                    if let newData=responseData?.characters{
                        if let _ = self.allCharacter?.characters{
                            print("appendig data")
                            self.allCharacter?.characters.append(contentsOf: newData)
                        } else {
                            print("first time")
                            self.allCharacter=responseData
                        }
                    }
//                    print(self.allCharacter as Any,"all caharcter data")
                } else {
                    print(error as Any, "Error from API")
                }
            }
        }
        
        
    }
    
    func getCharacterInfo(){
        let url="https://dattebayo-api.onrender.com/characters/?name=itachi"
        request(url: url, type: CharcterInfo.self){[weak self] responseData, error in
            guard let self=self else {return}
            DispatchQueue.main.async {
                if error==nil{
                    self.characer=responseData
                    print(self.characer as Any,"all caharcter data")
                } else {
                    print(error?.localizedDescription as Any, "Error from API")
                }
            }
        }
    }
    
    func getCharacter(name:String){
        let url=URL(string: AllUrl.page)!
        print(url,"url")
        var request=URLRequest(url: url)
        request.httpMethod = HttpMethod.Get.rawValue

        let dataTask=URLSession.shared.dataTask(with: request){(data, response, error) in
//            guard let error = error else {
//                print(error as Any,"Error fetching data")
//                return
//            }
            guard let response = response as? HTTPURLResponse else {
                return
            }

            if response.statusCode==200{
                guard let data=data else {return}
                DispatchQueue.main.async { [self] in
                    do {
                        let decodedData=try JSONDecoder().decode(AllCharacter.self, from: data)
                        self.allCharacter=decodedData
                        print(self.allCharacter as Any,"charcter info")
                    } catch let error {
                        print(error)
                    }
                }
            } else {
                print(response.statusCode,"staus code")
            }
        }
        dataTask.resume()
    }

    
    
}
