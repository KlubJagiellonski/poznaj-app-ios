//
//  APIStore.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 14.02.2017.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireSwiftyJSON
import CoreLocation

class APIStore : Store {
    
//    HTTP 200 OK
//    Allow: GET, PUT, PATCH, DELETE, HEAD, OPTIONS
//    Content-Type: application/json
//    Vary: Accept
//    
//    {
//    "id": 14,
//    "title": "Pierwszy wykłąd na Politechnice Wrocławskiej",
//    "image_file": "https://heroku-poznaj.s3.amazonaws.com/pierwszy_wyklad.jpg?AWSAccessKeyId=AKIAIIOTWIRZXIPTFS5Q&Signature=GD6Rku3c8DPcSE5d3fJu7CjL3lU%3D&Expires=1495474769",
//    "copyright": ""
//    }
    internal func fetchImageURL(id: UInt, completionHandler: @escaping (Image, StoreError?) -> ()) {
        Alamofire.request("https://poznaj-wroclaw.herokuapp.com/api/images/\(id)/").responseSwiftyJSON { response in
            if let json = response.result.value?.dictionary,
                let title = json["title"]?.string,
                let copyright = json["copyright"]?.string,
                let imageFile = json["image_file"]?.string,
                let url = URL(string: imageFile){
                completionHandler(Image(url: url, copyright: copyright, title: title),nil)
            }
        }
    }

    func fetchStoryDetails(id: UInt, completionHandler: @escaping ([Point], StoreError?) -> ()) {
        Alamofire.request("https://poznaj-wroclaw.herokuapp.com/api/stories/\(id)/points").responseSwiftyJSON{ response in
            if let json = response.result.value {
                if let array = json.array {
                    let points = array.flatMap({ json -> Point? in
                        if let dictionary = json.dictionary,
                            let coordinates = dictionary["geometry"]?["coordinates"].array,
                            let latitude = coordinates.first?.double,
                            let longitude = coordinates.last?.double,
                            let properties = dictionary["properties"],
                            let title = properties["title"].string,
                            let description = properties["description"].string,
                            let images = properties["images"].array?.map({ return IDableModel<Image>.id($0.uIntValue) }){
    
                            return Point(coordinate: CLLocationCoordinate2DMake(latitude, longitude), title: title, description: description, images: images)
                        }
                        return nil
                    })
                    completionHandler(points,nil)
                }
            }
            else if (response.error != nil) {
                completionHandler([],.cannotFetch(response.error!.localizedDescription))
            }
        }
    }
    
    func fetchStories(completionHandler: @escaping ([Story], StoreError?) -> ()) {
        Alamofire.request("https://poznaj-wroclaw.herokuapp.com/api/stories/").responseSwiftyJSON { response in
            if let json = response.result.value {
                if let array = json.array {
                    let stories = array.flatMap({ json -> Story? in
                        if let id = json.dictionary?["id"]?.int64,
                            let title = json.dictionary?["title"]?.string,
                            let description = json.dictionary?["description"]?.string,
                            let durationString = json.dictionary?["duration"]?.string,
                            let duration = Duration(string:durationString){
                            
                            return Story(id: id, title: title, description: description, duration: duration, images: [])
                        }
                        return nil
                    })
                    completionHandler(stories,nil)
                }
            }
            else if (response.error != nil) {
                completionHandler([],.cannotFetch(response.error!.localizedDescription))
            }
        }
    }
}
