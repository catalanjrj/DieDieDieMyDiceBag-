//
//  Die.swift
//  DiceBag
//
//  Created by Jorge Catalan on 5/24/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit

enum DieType {
    case D4
    case D6
    case D10
    case D20
    
    var diceRange: [Int] {
        switch self {
        case .D4:
            return [Int](1...4)
        case .D6:
            return [Int](1...6)
        case .D10:
            return [Int](0...9)
        case .D20:
            return [Int](1...20)
        }
    }
    
    var diceColor: UIColor {
        switch self {
        case .D4:
            return UIColor.blueColor()
        case .D6:
            return UIColor.redColor()
        case .D10:
            return UIColor.cyanColor()
        case .D20:
            return UIColor.orangeColor()
        }
    }
}
struct Die{
    var type:DieType
    var faceValues: Array<Int> { return type.diceRange }

    func rollIt() -> Int {
        return faceValues[Int(arc4random_uniform(UInt32(faceValues.count)))]
    }
}

