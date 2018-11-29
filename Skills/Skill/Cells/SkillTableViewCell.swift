//
//  SkillTableViewCell.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {
    var skill: Skill? { didSet { setup() }}

    @IBOutlet weak var skillNameLabel: UILabel!
    @IBOutlet weak var skillLevelBackground: UIView!
    @IBOutlet weak var skillLevelNameLabel: UILabel!
    @IBOutlet weak var optionalIndicator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        skillLevelBackground.layer.cornerRadius = 4
        skillLevelBackground.layer.masksToBounds = true
        
        optionalIndicator.layer.cornerRadius = 4
        optionalIndicator.layer.masksToBounds = true
    }

    private func setup() {
        if let skill = skill {
            skillNameLabel.text = skill.name
            skillLevelNameLabel.text = skill.level?.string ?? "no skill"
            skillLevelNameLabel.textColor = skill.level?.colors.fg ?? .white
            skillLevelBackground.backgroundColor = skill.level?.colors.bg ?? .darkGray
            
            if skill.items != nil {
                accessoryType = .disclosureIndicator
            } else {
                accessoryType = .none
            }
            
            if let optional = skill.optional, optional == true {
                optionalIndicator.isHidden = false
            } else {
                optionalIndicator.isHidden = true
            }
        }
    }
}
