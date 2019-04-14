//
//  superHero.swift
//  SuperHeroSAINalivela
//
//  Created by Student on 4/13/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct SuperHero:Codable{
    var squadName:String
    var homeTown:String
    var formed:Int
    var secretBase:String
    var active:Bool
    var members:[Member]
    
}
struct Member:Codable {
    var name:String
    var age:Int
    var secretIdentity:String
    var powers:[String]
}
