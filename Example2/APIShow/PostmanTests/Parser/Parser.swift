//
//  Parser.swift
//  Example2
//
//  Created by Gevorg Hovhannisyan on 10.02.22.
//

import Foundation
import SwiftUI
import Alamofire

struct Parser {
    
    func parse(comp: @escaping ([AdsWithCategories]) ->()) {
        
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTE0MDE4NjAsImlzcyI6Imh0dHA6Ly90cmFkZWxpc3QyLTAwMS1zaXRlMS5pdGVtcHVybC5jb20vIiwiYXVkIjoiTGlzdFRyYWRlIn0.bVgiJVd9ZUOKqAfxcyOPjdfUuyINEbO6LYUHZrt21o0"
        
        let api = URL(string: "https://api.malls.team/api/General/MainPage")
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        
        AF.request(api!, method: .get, headers: headers).responseJSON { response in
            
            if let resposeData = response.data, let resposeJson = try? JSONSerialization.jsonObject(with: resposeData, options: []) {
                
                print(resposeJson)
            }
            
            switch response.result {
                
            case .success(_):
                do {
                    
                    let result = try JSONDecoder().decode([AdsWithCategories].self, from: response.data!)
                    
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key \(key)not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value \(value) not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type \(type) mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
            case .failure(_):
                print("Error")
            }
        }.resume()
    }
}
