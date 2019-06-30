//
//  ViewController.swift
//  URLSessionJSONRequests
//
//  Created by Georgi Malkhasyan on 6/29/19.
//  Copyright © 2019 Malkhasyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onGetTapped(_ sender: Any) {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
//        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//            if let data = data {
//                print(data)
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                }catch{
//
//                }
//            }
//        }.resume()
    }
    
    @IBAction func onPostTapped(_ sender: Any) {
        let parameters = ["username": "@georgi_mal", "login": "malkhasyan"]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.httpBody = httpBody
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
        }.resume()
        
    }
}

