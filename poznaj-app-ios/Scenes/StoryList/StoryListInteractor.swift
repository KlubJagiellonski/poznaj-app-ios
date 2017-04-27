//
//  StoryListInteractor.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 10.02.2017.
//  Copyright (c) 2017 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import CoreLocation

protocol StoryListResponseBoundary
{
    func responded(stories: StoryList.Response)
}

class StoryListInteractor: StoryListRequestBoundary
{
    var output: StoryListResponseBoundary!
    var worker: FetchStoriesWorker!
  
    var stories : [Story]! {
        didSet {
            output.responded(stories: StoryList.Response(stories: stories))
        }
    }
    
  // MARK: - Business logic
  
    func fetchStories() {
    
    worker = FetchStoriesWorker(storage: MockedStore())
        worker.fetchStories(completionHandler: { stories in
            self.stories = stories
        })
    }
}
