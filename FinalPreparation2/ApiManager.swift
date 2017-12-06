//
//  ApiManager.swift
//  FinalPreparation2
//
//  Created by Zhanara Tanirbergenova on 06.12.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import Foundation

public typealias CompletionClosure = (_ data: Data) -> Void
class ApiManager: NSObject {
    class func getDataFromServer(cClusure: @escaping CompletionClosure) {
        let urlString = "https://gist.githubusercontent.com/anonymous/d67ec196fd90668f8051d6f8dd68745a/raw/96f64865087adc4600a6030b587e0053998f7162/7eff5196-da2b-11e7-b7f1-e383207cad43.json"

        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.addValue("xml", forHTTPHeaderField: "Con")

        request.httpMethod = "GET"
        let session = Foundation.URLSession.shared

        let task = session.dataTask(with: url!) { data, response, error -> Void in
            if let jsonData = data{
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print(jsonString)
                }

                DispatchQueue.main.async {
                    cClusure(jsonData)
                }
            }

            else if let requestError = error{
                print("\(requestError) error")
            }
            else{
                print("Unexpected error")
            }
        }
        task.resume()
    }

}
