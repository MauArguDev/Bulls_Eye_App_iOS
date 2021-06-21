//
//  Game.swift
//  Bullseye
//
//  Created by user199344 on 6/18/21.
//

import Foundation

struct Game{
    var target = Int.random(in: 1...100)
    var score = 0
    var current = 1
    
    func points(sliderValue: Int) -> Int {
        
        let awardedPoint = 100 - (abs(target - sliderValue))
        
        return awardedPoint
    }
}
    
