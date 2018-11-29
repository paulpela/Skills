//
//  Skill.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

struct Skill: Codable {
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
            case .novice: return (fg: .white, bg: .red)
            case .beginner: return (fg: .white, bg: .red)
            case .competent: return (fg: .white, bg: .orange)
            case .skilled: return (fg: .white, bg: .orange)
            case .proficient: return (fg: .black, bg: .yellow)
            case .adept: return (fg: .black, bg: .yellow)
            case .expert: return (fg: .white, bg: .green)
            case .accomplished: return (fg: .white, bg: .green)
            case .master: return (fg: .white, bg: .blue)
            case .legendary: return (fg: .white, bg: .blue)
            }
        }
    }
    
    enum CodingKeys : String, CodingKey {
        case name
        case _level = "level"
        case items
    }
    
    private(set) var name: String
    private(set) var items: [Skill]?
    
    private var _level: Level?
    
    var level: Level? {
        get {
            if items != nil {
                let sum = items?.reduce(0.0, { (result, skill) -> Double in
                    result + Double(skill.level?.rawValue ?? 0)
                })
                
                let count = Double(items?.count ?? 0)
                
                if count == 0.0 {
                    return _level
                } else {
                    return Level(rawValue: Int(((sum ?? 0) / count).rounded()))
                }
            } else {
                return _level
            }
        }
        
        set {
            _level = newValue
        }
    }
    
    init(name: String, level: Level?, items: [Skill]?) {
        self.name = name
        self._level = level
        self.items = items
    }
}
