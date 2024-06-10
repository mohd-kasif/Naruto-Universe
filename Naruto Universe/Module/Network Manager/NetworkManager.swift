//
//  NetworkManager.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 25/04/24.
//

import Foundation
import SwiftUI
enum APIError:Error{
    case invalidUrl
    case requestFailed(description:String="")
    case failedSerialization
    
    var description:String{
        switch self{
        case .invalidUrl:
            return "invalid url"
        case  let .requestFailed(description):
            return ""
        case .failedSerialization:
            return "failed serialization"
        }
    }
}

class NetworkManager{
    private var session:URLSession?
    var sessionConfiguration:URLSessionConfiguration
    init(){
        sessionConfiguration=URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest=90
        sessionConfiguration.timeoutIntervalForResource=90
        sessionConfiguration.urlCache=nil
        self.session=URLSession(configuration: sessionConfiguration)
    }
    
    func request<T:Codable>(url:String, type:T.Type, httpMethod:HttpMethod = .Get, completion: @escaping(T?, APIError?)->Void){
        print(url,"url")
        guard let url=URL(string: url) else {
            completion(nil,APIError.invalidUrl)
            return
        }
        var request=URLRequest(url: url)
        request.httpMethod=httpMethod.rawValue
        
        let dataTask=self.session?.dataTask(with: request){data, response, error in
            
            DispatchQueue.main.async {
                if let error=error{
                    completion(nil, APIError.requestFailed(description: error.localizedDescription))
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, APIError.requestFailed(description: "Request Failed"))
                    return
                }
                guard let responseData=data else {
                    completion(nil, APIError.requestFailed(description: "Request Failed"))
                    return
                }
                
                if httpResponse.statusCode==200{
                    do {
                        let decoder=JSONDecoder()
                        let decodedObject=try decoder.decode(type, from: responseData)
                        completion(decodedObject, nil)
                    }catch let error{
                        print(error,"serialization error")
                        completion(nil, APIError.failedSerialization)
                    }
                }
                
                
                
            }
        }
        dataTask?.resume()
    }
}


extension NetworkManager{
    func request(url:String) async throws -> UIImage{
        guard let url=URL(string: url) else {
            throw APIError.invalidUrl
        }
        var request=URLRequest(url: url)
        request.httpMethod=HttpMethod.Get.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw APIError.requestFailed(description: "")}
        if let image=UIImage(data: data){
            return image
        } else {
            throw APIError.failedSerialization
        }
    }
        
    func request<T:Codable>(url:String, type:T.Type, httpMethod:HttpMethod = .Get) async throws->T?{
        guard let url=URL(string: url) else {throw APIError.invalidUrl}
        var request=URLRequest(url: url)
        request.httpMethod=httpMethod.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw APIError.requestFailed(description: "request failed")}
        let decoder=JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
