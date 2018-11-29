//
//  Skill.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

class Skill: Codable {
    enum CodingKeys : String, CodingKey {
        case name
        case optional
        case _level = "level"
        case items
    }
    
    private(set) var name: String
    private(set) var optional: Bool?
    private(set) var items: [Skill]?
    
    private var _level: Level?
    
    var level: Level? {
        get {
            if items != nil {
                let average = items?.reduce(0.0, { (result, skill) -> Double in
                    if skill.level == nil { return result }
                    
                    let normalResult = (result + Double(skill.level?.rawValue ?? 0)) / 2.0
                    
                    if let optional = skill.optional, optional == true {
                        return result >= normalResult ? result : normalResult
                    } else {
                        return normalResult
                    }
                })
                
                if let average = average {
                    return Level(rawValue: Int(average.rounded()))
                } else {
                    return Level.noSkill
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
