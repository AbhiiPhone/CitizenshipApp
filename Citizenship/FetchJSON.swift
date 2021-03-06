//
//  FetchJSON.swift
//  Cut Price Skipper
//
//  Created by @vi on 18/05/17.
//  Copyright © 2017 AbhiMicronix. All rights reserved.
//


import Foundation
import Alamofire

protocol jsonDataDelegate {
    func didReceiveData(_ data:Any, jsonName: String) -> Void;
    func didFailedtoReceiveData(_ error: Error) -> Void;
}

class JsonFetchClass: NSObject {
    
    let definedLink = URL(string: "http://bestauctionsoftware.com/citi/json.php")
    var jsonData: jsonDataDelegate?
    
    func fetchData(_ parameters:[String: String], methodType: String, url: String, JSONName: String ) -> Void {
        
        DispatchQueue.main.async {
            
//            print(parameters)
            
            if Reachability.isConnectedToNetwork() {
                
                if methodType == "POST" || methodType == "post" {
                    
                    
                    let parameters1: [String: String] = parameters
                    
                    Alamofire.request(self.definedLink!,method: .post, parameters: parameters1, encoding: JSONEncoding.default, headers: [:])
                        .responseJSON {
                            response in
                            
                            //                print(response.request as Any)  // original URL request
                            //                print(response.response as Any) // URL response
                            //                print(response.result as Any)
//                                            print(response.result.value as Any)   // result of response serialization
                            
                            switch(response.result) {
                                
                            case .success(_):
                                
                                var dictionary = NSDictionary()
                                
                                dictionary = response.result.value as! NSDictionary
                                
//                                    print(dictionary)
                                
                                    self.jsonData?.didReceiveData(dictionary, jsonName: JSONName)
                                
                                    break
                                
                            case .failure(_):
                                
                                print("error: \(response.result.error!)" )
                                
                                    self.jsonData?.didFailedtoReceiveData(response.result.error! as Error)
                                
                                    break
                                
                            }
                    }
                }
                else if methodType == "GET" || methodType == "get"{
                    
                    let urlLink :String = "http://bestauctionsoftware.com/citi/json.php" + url
                    
                    //
                    
                    //                print(urlLink)
                    
                    let encodedHost = urlLink.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
                    
                    //            let url = NSURL(string: urlLink)
                    
                    print(encodedHost!)
                    
                    Alamofire.request(URL(string: encodedHost!)!,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:])
                        .responseJSON {
                            response in
                            
                            //                                    print(response.request as Any)  // original URL request
                            //                print(response.response as Any) // URL response
                            //                                    print(response.result as Any)
                            //                        print(response.result.value as Any)   // result of response serialization
                            
                            switch(response.result) {
                                
                            case .success(_):
                                
                                //                            var responceData = response.result.value
                                
                                self.jsonData?.didReceiveData(response.result.value!, jsonName: JSONName)
                                
                                /*  if response.result.value is Dictionary<AnyHashable,Any> {
                                 
                                 print("Yes, it's a Dictionary")
                                 
                                 var dic = NSDictionary()
                                 
                                 dic = response.result.value as! NSDictionary
                                 
                                 print(dic)
                                 
                                 self.jsonData?.didReceiveData(dic, jsonName: JSONName)
                                 }
                                 else{
                                 var array = NSArray()
                                 
                                 array = response.result.value as! NSArray
                                 
                                 print(array)
                                 
                                 self.jsonData?.didReceiveData(array, jsonName: JSONName)
                                 }*/
                                
                                
                                
                                
                                
                                break
                                
                            case .failure(_):
                                
                                //                    print(response.result.error!)
                                
                                self.jsonData?.didFailedtoReceiveData(response.result.error! as Error)
                                
                                break
                                
                            }
                    }
                    
                    
                    
                }
            
                
            }
            else{
                
                
                self.jsonData?.didReceiveData("NO INTERNET CONNECTION", jsonName: "NoInternet")
                
            }
        }
        
    }
    
}


