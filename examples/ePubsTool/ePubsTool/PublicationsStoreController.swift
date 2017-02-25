//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

//public enum HTTPStatus: Int {
//    case success = 200
//}


public enum PublicationsSearchError: Error {
    case invalidSearchTerm
}

private let searchURLFormat = "https://itunes.apple.com/search?media=ebook&term=%@&limit=%d"
private let mainController = PublicationsStoreController()

class PublicationsStoreController: NSObject
{
    static let mainQueueController: PublicationsStoreController = PublicationsStoreController()
    
    func search(_ term: String, limit: Int = 20, completion: @escaping (_ json: [String: AnyObject]?) -> ()) throws
    {
        guard let s = String(format: searchURLFormat, term, limit).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            let searchURL = URL(string: s) else {
                print("Unable to compose URL with term '\(term)'")
                throw PublicationsSearchError.invalidSearchTerm
        }
        
        performSearch(searchURL, completion: completion)
    }
    
    
    func performSearch(_ url: URL, completion: @escaping (_ json: [String: AnyObject]?) -> ())
    {
        dataTask(url, completion: completion).resume()
    }
    
    func dataTask(_ url: URL, completion: @escaping (_ json: [String: AnyObject]?) -> Void) -> URLSessionDataTask
    {
        return URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data, let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
                print("error: \(error)")
                return
            }
            guard let info = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject] else {
                print("Response data couldn't be parsed as JSON for response: \(response)")
                return
            }
            
            completion(info)
        }
    }
    
//    func handleResponse(data: Data?, response: URLResponse?, error: NSError?)
//    {
//        guard error == nil, let data = data, httpResponse = response as? HTTPURLResponse where httpResponse.statusCode == 200 else {
//            print("error: \(error)")
//            return
//        }
//        guard let info = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject] else {
//            print("Response data couldn't be parsed as JSON for response: \(response)")
//            return
//        }
//        
//        completion(json: info)
//    }
}
