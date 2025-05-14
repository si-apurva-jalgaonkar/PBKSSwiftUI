//
//  ServiceManager.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 25/06/24.
//

import Foundation

enum NetworkHeaderType: String {
    case cleanAuthorization
//    case profileAuth
//    case loginAuth
//    case notificationAuth
//    case loyaltyAuth
//    case fanLoyaltyAuth
}

enum ServiceError: String, Error {
    case noInternet
    case invalidUrl = "Invalid Url"
    case dataFailure = "Invalid Data"
    case invalidResponse = "Invalid Response"
    case unknownIssue = "Something went wrong!! Please try after some time"
    case userAccountExist = "User account already Exist."
    case none
    var description: String {self.rawValue}
}

import Foundation

class ServiceManager {
    static let shared = ServiceManager()
    private let session: URLSession
    
    init() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.waitsForConnectivity = true
        sessionConfig.allowsConstrainedNetworkAccess = true
        sessionConfig.allowsCellularAccess = true
        session = URLSession(configuration: sessionConfig)
    }
    
    private func getHeaders(_ type: NetworkHeaderType) -> [String:String]? {
        switch type {
        case .cleanAuthorization:
            return nil
        }
    }

    func makeGetRequest<T: Codable>(url: String,
                                    type: T.Type,
                                    headerType: NetworkHeaderType = .cleanAuthorization,
                                    completion: @escaping (Result<T, ServiceError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        print("URL : \(url) ")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.allHTTPHeaderFields = getHeaders(headerType)
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.waitsForConnectivity = true
        sessionConfig.allowsConstrainedNetworkAccess = true
        sessionConfig.allowsCellularAccess = true
        
        let session = URLSession(configuration: sessionConfig)
      //  print("request payload", request.curlString)
        let task = session.dataTask(with: request,
                                    completionHandler: {data, response, error in
            
            guard error == nil else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataFailure))
                return
            }
            //      debugPrint(String(data: data, encoding: .utf8))
            guard response != nil else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let returnedResponse = try decoder.decode(T.self, from: data)
                completion(.success(returnedResponse))
            } catch {
                debugPrint("Get Service Error: \(error)")
                completion(.failure(.invalidResponse))
                return
            }
            
        })
        task.resume()
    }

}

