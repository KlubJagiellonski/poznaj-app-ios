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

class APIStore : Store {
    internal func fetchStoryDetails(_ completionHandler: @escaping ([Point], StoreError?) -> ()) {
        completionHandler([],nil)
    }

    func fetchStories(_ completionHandler: @escaping ([Story], StoreError?) -> ()) {
        Alamofire.request("https://poznaj-wroclaw.herokuapp.com/api/stories/").responseSwiftyJSON { response in
            if let json = response.result.value {
                if let array = json.array {
                    let stories = array.flatMap({ json -> Story? in
                        if let id = json.dictionary?["id"]?.int64,
                            let title = json.dictionary?["title"]?.string,
                            let description = json.dictionary?["description"]?.string,
                            let durationString = json.dictionary?["duration"]?.string,
                            let duration = Duration(string:durationString){
                            
                            return Story(id: id, title: title, description: description, duration: duration, points:[])
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
