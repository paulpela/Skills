//
//  Skill.swift
//  Skills
//
//  Created by Paweł Pela on 29/11/2018.
//  Copyright © 2018 Paweł Pela. All rights reserved.
//

import UIKit

struct Skill: Codable {
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
                
                let count = Double(items?.filter({ (skill) -> Bool in
                    skill.level != nil
                }).count ?? 0)
                
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
