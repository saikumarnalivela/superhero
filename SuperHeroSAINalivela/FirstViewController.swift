//
//  FirstViewController.swift
//  SuperHeroSAINalivela
//
//  Created by Student on 4/13/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
class FirstViewController:UITableViewController{
   // var superHeroInfo = "https://www.dropbox.com/s/wpz5yu54yko6e9j/squad.json?dl=1"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        let urlSession = URLSession.shared
        let url = URL(string: "https://www.dropbox.com/s/wpz5yu54yko6e9j/squad.json?dl=1")!
        urlSession.dataTask(with: url, completionHandler: showISSData).resume()
    }
    
    var HeroDetails:[Member] = []

    
    func showISSData(data:Data?, urlResponse:URLResponse?, error:Error?){
        do {
            let decoder = JSONDecoder()
            HeroDetails = try decoder.decode(SuperHero.self, from: data!).members
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
        return HeroDetails.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "superCell", for: indexPath)
        
        // Configure the cell...
        let heromember = HeroDetails[indexPath.row]
        cell.textLabel?.text = "\(heromember.name) (aka: \(heromember.secretIdentity))"
        cell.detailTextLabel?.text = "\(heromember.powers[0]) , \(heromember.powers[1]) , \(heromember.powers[02])"
        return cell
    }
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String?{
        if section == 0{
            return "SUPERHEROS"
        }
        else{
            return "NULL"
        }
    }
    


}


