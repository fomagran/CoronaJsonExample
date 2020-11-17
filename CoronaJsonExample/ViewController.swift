//
//  ViewController.swift
//  CoronaJsonExample
//
//  Created by Fomagran on 2020/11/15.
//

import UIKit

class ViewController: UIViewController {
    var datas = [String:Any]()
    var countryArr = [String]()
    var personalArr = [String]()
    var areaArr = [String]()
    //commit test
    var key = "6b45564450666f6d363570716e6163"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let path = "http://openAPI.seoul.go.kr:8088/\(key)/json/Corona19Stauts/1/10/"
        
        if let url = URL(string: path) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                        self.datas = json
                    }
                }
            }.resume()
        }
        
        if let data = datas["DATA"] as? [[String:Any]] {
            for i in 0..<10 {
                countryArr.append("\(data[i]["corona19_country"]!)" )
                personalArr.append("\(data[i]["corona19_personal"]!)" )
                areaArr.append("\(data[i]["corona19_area"]!)" )
                
            }
        }
        print("country\(countryArr)")
        print("personal\(personalArr)")
        print("area\(areaArr)")
        
    }
}
        





