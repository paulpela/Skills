//
//  Skill+Level.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

extension Skill {
    enum Level: Int, Codable {
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
            switch self {
            case .noSkill: return (fg: .white, bg: .darkGray)
            case .novice: return (fg: .white, bg: #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1))
            case .beginner: return (fg: .white, bg: #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1))
            case .competent: return (fg: .white, bg: #colorLiteral(red: 0.8527129709, green: 0.3239575046, blue: 0.2078772844, alpha: 1))
            case .skilled: return (fg: .white, bg: #colorLiteral(red: 0.8527129709, green: 0.3239575046, blue: 0.2078772844, alpha: 1))
            case .proficient: return (fg: .white, bg: #colorLiteral(red: 0.8540754008, green: 0.5632280909, blue: 0.115415594, alpha: 1))
            case .adept: return (fg: .white, bg: #colorLiteral(red: 0.8540754008, green: 0.5632280909, blue: 0.115415594, alpha: 1))
            case .expert: return (fg: .white, bg: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))
            case .accomplished: return (fg: .white, bg: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))
            case .master: return (fg: .white, bg: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
            case .legendary: return (fg: .white, bg: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
            }
        }
        
        var description: String {
            switch self {
            case .noSkill: return "You have no skill in this domain."
            case .novice: return "You have started acquiring basic knowledge in this domain."
            case .beginner: return "You have acquired some basic knowledge in this domain."
            case .competent: return "You are beginning to play with your knowledge in this domain."
            case .skilled: return "You have played with your knowledge in this domain for some time."
            case .proficient: return "You have created basic products based on the knowledge of this domain."
            case .adept: return "You have created more advanced products based on the knowledge of this domain."
            case .expert: return "You are beginning to use the knowledge from this domain to creatively resolve problems."
            case .accomplished: return "You are regularly using the knowledge from this domain to creatively resolve problems."
            case .master: return "You have invented solutions in this domain."
            case .legendary: return "You have invented solutions in this domain and are known for this."
            }
        }
    }
}
