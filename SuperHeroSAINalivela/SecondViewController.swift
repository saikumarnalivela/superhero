//
//  SecondViewController.swift
//  SuperHeroSAINalivela
//
//  Created by Student on 4/13/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit



class SecondViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var displayArray:[laurates] = []
    
    var laureatesLink = "https://www.dropbox.com/s/7dhdrygnd4khgj2/laureates.json?dl=1"
    
    override func viewWillAppear(_ animated: Bool) {
        if displayArray.count == 0{
        let urlSession = URLSession.shared
        let url = URL(string: laureatesLink)
            print(url ?? "nil")
        urlSession.dataTask(with: url!, completionHandler: displayleureates).resume()
        }
    }
    
    func displayleureates(data:Data?, urlResponse:URLResponse?, error:Error?)->Void {
        var name:[[String:Any]]!
        var firstname:String?
        var lastname:String?
        var born:String?
        var died:String?
        do {
            try name = JSONSerialization.jsonObject(with: data!,
                                                             options: .allowFragments) as? [[String:Any]]
            for i in name {
                firstname = i["firstname"] as? String // not [String:Double]
                lastname = i["surname"] as? String
                born  = i["born"] as? String
                died = i["died"] as? String
                //display(message:String(format:"%.1f °F", temperature))
                let obkct  = laurates(firstname: firstname, surname: lastname, born: born, died: died)
                displayArray.append(obkct)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            print(error)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return displayArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
        
        // Configure the cell...
        let heromember = displayArray[indexPath.row]
        let nameLabel = cell.viewWithTag(100) as! UILabel
        let BornLabel = cell.viewWithTag(101) as! UILabel
        nameLabel.text = "\(heromember.firstname!) \(heromember.surname!)"
        BornLabel.text = "\(heromember.born!) \(heromember.died!)"
       // cell.textLabel?.text = "\(heromember.name) (aka: \(heromember.secretIdentity))"
        //cell.detailTextLabel?.text = "\(heromember.powers[0]) , \(heromember.powers[1]) , \(heromember.powers[02])"
        return cell
    }
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String?{
        if section == 0{
            return "LAUREATES"
        }
        else{
            return "NULL"
        }
    }
    

}

struct laurates{
    var firstname:String?
    var surname:String?
    var born:String?
    var died:String?
}

