//
//  SkillTableViewController.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

class SkillTableViewController: UITableViewController {
    var skills: [Skill]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SkillCell", for: indexPath) as! SkillTableViewCell

        cell.skill = skills?[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = UIStoryboard.init(name: "Skill", bundle: nil).instantiateInitialViewController() as! SkillTableViewController
        
        newVC.title = skills?[indexPath.row].name
        newVC.skills = skills?[indexPath.row].items
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }

}
