//
//  ProfileViewController.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var levelBackground: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet var tabBackgrounds: [UIView]!
    @IBOutlet var levelLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        levelBackground.layer.cornerRadius = 4
        levelBackground.layer.masksToBounds = true
        
        for tabBackground in tabBackgrounds {
            tabBackground.layer.cornerRadius = 4
            tabBackground.layer.masksToBounds = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        levelBackground.backgroundColor = AppDelegate.rootSkill?.level?.colors.bg ?? .darkGray
        levelLabel.text = AppDelegate.rootSkill?.level?.string ?? "no skill"
        
        if let tabSkills = AppDelegate.rootSkill?.items {
            for (index, tab) in tabSkills.enumerated() {
                tabBackgrounds[index].backgroundColor = tab.level?.colors.bg ?? .darkGray
                levelLabels[index].text = tab.level?.string ?? "no skill"
            }
        }
    }

}
