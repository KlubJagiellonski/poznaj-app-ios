//
//  StoryDetailsInteractor.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 26.04.2017.
//  Copyright (c) 2017 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol StoryDetailsResponseBoundary
{
  func presentSomething(response: StoryDetails.Something.Response)
}

class StoryDetailsInteractor: StoryDetailsRequestBoundary
{
  var output: StoryDetailsResponseBoundary!
  var worker: StoryDetailsWorker!
  
  // MARK: - Business logic
  
  func doSomething(request: StoryDetails.Something.Request)
  {
    // NOTE: Create some Worker to do the work
    
    worker = StoryDetailsWorker()
    worker.doSomeWork()
    
    // NOTE: Pass the result to the Presenter
    
    let response = StoryDetails.Something.Response()
    output.presentSomething(response: response)
  }
}
