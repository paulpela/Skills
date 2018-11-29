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
                var countWithOptionals = 0
                let sumWithOptionals = items?.reduce(0.0, { (result, skill) -> Double in
                    guard let level = skill.level?.rawValue else { return result }
                    countWithOptionals += 1
                    return result + Double(level)
                })
                
                var countWithoutOptionals = 0
                let sumWithoutOptionals = items?.reduce(0.0, { (result, skill) -> Double in
                    guard let optional = skill.optional, optional != true else { return result }
                    guard let level = skill.level?.rawValue else { return result }
                    
                    countWithoutOptionals += 1
                    return result + Double(level)
                })
                
                if let sumWithOptionals = sumWithOptionals, let sumWithoutOptionals = sumWithoutOptionals {
                    let averageWithOptionals = countWithOptionals > 0 ? sumWithOptionals / Double(countWithOptionals) : 0.0
                    let averageWithoutOptionals = countWithoutOptionals > 0 ? sumWithoutOptionals / Double(countWithoutOptionals) : 0.0
                    
                    let avgLevel = Int(max(averageWithOptionals, averageWithoutOptionals).rounded())
                    return Level(rawValue: avgLevel)
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
