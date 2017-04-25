//
//  Story.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 13.02.2017.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

struct Duration {
    let hours: Int
    let minutes: Int
    
    init?(string: String) {
        let splitted = string.characters.split(separator: ":")
        guard //splitted.count == 2,
            let hours = Int(String(splitted[0])),
            let minutes = Int(String(splitted[1]))
            else {return nil}
        
        self.hours = hours
        self.minutes = minutes
        
    }
}

struct Story : Equatable {
    let id: Int64
    let title: String
    let description: String
    let duration: Duration
    let points : [ApiIDableObject<Point>]
}

func ==(lhs: Story, rhs: Story) -> Bool {
    return lhs.id == rhs.id
}


enum ApiIDableObject<T> : ExpressibleByIntegerLiteral {

    case id(UInt)
    case object(T)
    
    public init(integerLiteral value: IntegerLiteralType){
        self = .id(UInt(value))
    }
    
}

struct Point {
    let coordinate : CLLocationCoordinate2D
    let title : String
    let description : String
    let images : [ApiIDableObject<NSURL>]

}
