//
//  MockedStore.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 25.02.2017.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    init(_ lat:CLLocationDegrees, _ lon:CLLocationDegrees) {
        self.init(latitude:lat,longitude:lon)
    }
}

struct ApiImage{
    let id : UInt
    let title : String
    let url : String
    let copyright : String
}

struct ApiStory {
    let id : UInt
    let title : String
    let description : String
    let duration : String
    let first_point : UInt
    let images: [ApiImage]
}

struct ApiPoint {
    let id : UInt
    let coordinates : (Double,Double)
    let title : String
    let description : String
    let images : [ApiImage]
}

class MockedStore : Store {
    internal func fetchImageURL(id: UInt, completionHandler: @escaping (Image, StoreError?) -> ()) {
        completionHandler(MockedStore.images.filter{$0.id == id}.map{Image(url:URL(string:$0.url)!, copyright: $0.copyright, title: $0.title)}.first!, nil)
    }

    
    let stories = [
        ApiStory(id: 1, title: "Story 1", description: "This is description of story 1", duration: "3:4", first_point: 4, images: [images[0]])
    ]
    
    static let images = [
        ApiImage(id: 1, title: "Image 1", url: "http://lorempixel.com/output/animals-q-c-640-480-4.jpg", copyright: "cp1"),
        ApiImage(id: 2, title: "Image 2", url: "http://lorempixel.com/output/animals-q-c-640-480-4.jpg", copyright: "cp2"),
        ApiImage(id: 3, title: "Image 3", url: "http://lorempixel.com/output/animals-q-c-640-480-4.jpg", copyright: "cp3"),
        ApiImage(id: 4, title: "Image 4", url: "http://lorempixel.com/output/animals-q-c-640-480-4.jpg", copyright: "cp4$"),
        ]
    
    let points = [
        ApiPoint(id:1, coordinates: (2.0, 1.4), title: "", description: "", images: [images[0],images[1]]),
        ApiPoint(id:2, coordinates: (2.0, 1.4), title: "", description: "", images: [images[2],images[3]]),
        ApiPoint(id:3, coordinates: (2.0, 1.4), title: "", description: "", images: [images[0],images[1]]),
        ApiPoint(id:4, coordinates: (2.0, 1.4), title: "", description: "", images: [images[2],images[3]])
    ]
    
    
    
    func fetchStories(completionHandler: @escaping(_ stories:[Story], _ error: StoreError? ) -> ()) {
        completionHandler(
            stories.map({ (apiStory:ApiStory) -> Story in
                return Story(id:Int64(apiStory.id), title:apiStory.title, description: apiStory.description, duration: Duration(string: apiStory.duration)!, images: apiStory.images.map { Image(url: URL(string: $0.url)!, copyright: $0.copyright, title: $0.title) })
            })
            , nil)
    }
    
    internal func fetchStoryDetails(id: UInt, completionHandler: @escaping ([Point], StoreError?) -> ()) {
        completionHandler({points.map({Point(coordinate:CLLocationCoordinate2D($0.coordinates.0, $0.coordinates.1), title:$0.title, description:$0.description,images:$0.images.map({IDableModel.id($0.id)}))})}(),nil)
    }

}
