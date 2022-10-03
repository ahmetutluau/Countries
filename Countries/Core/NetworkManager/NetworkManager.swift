//
//  NetworkManager.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    var headers: [(vi:String, k:String)]?
    
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethods,headers: [(vi:String, k:String)]? = nil, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        let session = URLSession.shared
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            for header in headers ?? [] {
                request.setValue(header.vi, forHTTPHeaderField: header.k)
            }
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(.failure(.generalError))
                } else if let data = data {
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                } else {
                    completion(.failure(.invalidUrl))
                }
            }
            dataTask.resume()
        }
        
    }
    
    fileprivate func handleResponse<T:Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        do{
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        }catch{
            completion(.failure(.invalidData))
        }
    }
}
