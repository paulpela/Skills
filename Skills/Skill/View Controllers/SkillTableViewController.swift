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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
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
        if skills?[indexPath.row].items == nil {
            if let currentLevel = skills?[indexPath.row].level, currentLevel != .legendary {
                let nextLevel = Skill.Level(rawValue: currentLevel.rawValue + 1)
                
                let levelDescription = nextLevel?.requirements.joined(separator: "\n")
                let alert = UIAlertController(title: "Advance \(skills?[indexPath.row].name ?? "this skill")?", message: "You are advancing this skill to \((nextLevel?.string)!).\n\(levelDescription)", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Advance", style: .default, handler: { (action) in
                    self.skills?[indexPath.row].advanceLevel()
                    tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.left)
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let newVC = UIStoryboard.init(name: "Skill", bundle: nil).instantiateInitialViewController() as! SkillTableViewController
            
            newVC.title = skills?[indexPath.row].name
            newVC.skills = skills?[indexPath.row].items
            
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }

}
