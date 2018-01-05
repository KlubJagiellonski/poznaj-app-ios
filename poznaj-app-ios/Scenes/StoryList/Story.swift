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

struct Image {
    let url: URL
    let copyright: String
    let title: String
}

struct Story : Equatable {
    let id: Int64
    let title: String
    let description: String
    let duration: Duration
    let images: [Image]
   // var points: [IDableModel<Point>]
    
//    mutating func set(points :[Point]) {
//        self.points = points.map{ IDableModel<Point>.some($0) }
//    }
}

func ==(lhs: Story, rhs: Story) -> Bool {
    return lhs.id == rhs.id
}

enum IDableModel<T> {
    case id(UInt)
    case some(T)
    
    var model : T? {
        get{
            switch self {
            case .some(let t):
                return t
            default:
                return nil
            }
        }
        
        set {
            if let newValue = newValue {
                self = IDableModel<T>.some(newValue)
            }
        }
    }
    
    var id : UInt? {
        get {
            switch self {
            case .id(let id):
                return id
            default:
                return nil
            }
        }
    }
    
    mutating func update(model: T){
        self = .some(model)
    }
}

struct Point {
    let coordinate : CLLocationCoordinate2D
    let title : String
    let description : String
    private(set) var images: [IDableModel<Image>]
    
    mutating func updateImage(image: Image, id: UInt){
        if let index = images.index(where: {$0.id == id}){
            self.images[index] = IDableModel<Image>.some(image)
        }
    }
}
