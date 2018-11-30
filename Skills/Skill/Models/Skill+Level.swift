//
//  Skill+Level.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

extension Skill {
    enum Level: Int, Codable, CaseIterable {
        case noSkill        = 0
        case novice         = 1
        case beginner       = 2
        case competent      = 3
        case skilled        = 4
        case proficient     = 5
        case adept          = 6
        case expert         = 7
        case accomplished   = 8
        case master         = 9
        case legendary      = 10
        
        var string: String {
            switch self {
            case .noSkill: return "no skill"
            case .novice: return "novice"
            case .beginner: return "beginner"
            case .competent: return "competent"
            case .skilled: return "skilled"
            case .proficient: return "proficient"
            case .adept: return "adept"
            case .expert: return "expert"
            case .accomplished: return "accomplished"
            case .master: return "master"
            case .legendary: return "legendary"
            }
        }
        
        var colors: (fg: UIColor, bg: UIColor) {
            if self.rawValue == 0 { return  (fg: .white, bg: .darkGray)}
            
            let hueMax: CGFloat = 220.0
            let degreesPerLevel = hueMax / CGFloat(Level.allCases.count) * (1.0 / 360.0)
            
            return (fg: .white, bg: UIColor(
                hue: CGFloat(self.rawValue) * degreesPerLevel,
                saturation: 0.9,
                brightness: 0.7,
                alpha: 1.0
            ))
        }

        var requirements: [String] {
            switch self {
            case .noSkill: return
                [
                    "You have no skill in this domain."
                ]
            case .novice: return
                [
                    "You have started acquiring basic knowledge in this domain.",
                    "You know this exists, but would not be able to write any code on paper.",
                    "You may have created a project following a tutorial."
                ]
            case .beginner: return
                [
                    "You have acquired some basic knowledge in this domain.",
                    "You have used this knowledge in some simple projects of your own."
                ]
            case .competent: return [ "You are beginning to play with your knowledge in this domain." ]
            case .skilled: return [ "You have played with your knowledge in this domain for some time." ]
            case .proficient: return
                [
                    "You have created basic products based on the knowledge of this domain.",
                    "Other people are using your products you have created using knowledge in this domain."
                ]
            case .adept: return [ "You have created more advanced products based on the knowledge of this domain." ]
            case .expert: return [ "You are beginning to use the knowledge from this domain to creatively resolve problems." ]
            case .accomplished: return [ "You are regularly using the knowledge from this domain to creatively resolve problems." ]
            case .master: return [ "You have invented some solutions in this domain." ]
            case .legendary: return [ "You have invented the solution in this domain." ]
            }
        }
    }
    
    func advanceLevel() {
        let currentLevel = self.level?.rawValue ?? 0
        
        self.level = Level(rawValue: currentLevel + 1)
    }
}
