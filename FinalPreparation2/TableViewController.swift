//
//  TableViewController.swift
//  FinalPreparation2
//
//  Created by Zhanara Tanirbergenova on 06.12.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var people: Array<Person> = []

    override func viewDidLoad() {
        ApiManager.getDataFromServer{
            (data) -> Void in
            do{
                let allPeople = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                if let arrJSON = allPeople["people"] as? [[String: Any]] {
                    for item in arrJSON{
                        self.people.append(Person(name: item["name"] as! String, age: item["age"] as! String))
                        print("here")
                    }

                }
                print(self.people.count)
            }
            catch{
                print("something went wrong")
            }
        }
    }
    
//    let people = Utils.getData()


//    func getData(){
//        ApiManager.getDataFromServer{
//            (data) -> Void in
//            do{
//                let allPeople = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
//                if let arrJSON = allPeople["people"] as? [[String: Any]] {
//                    for item in arrJSON{
//                        self.people.append(Person(name: item["name"] as! String, age: item["age"] as! String))
//                    }
//
//                }
//            }
//            catch{
//                print("something went wrong")
//            }
//        }
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.people.count)
        return self.people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        getData()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.people[indexPath.row].name
        return cell!

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
