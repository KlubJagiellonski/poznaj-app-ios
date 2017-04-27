//
//  StoryListWorkerTests.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 11.04.2017.
//  Copyright (c) 2017 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import poznaj_app_ios
import XCTest

class StoryListWorkerTests: XCTestCase
{
  // MARK: - Subject under test
  
  var sut: FetchStoriesWorker!
  
  // MARK: - Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupStoryListWorker()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: - Test setup
  
  func setupStoryListWorker()
  {
    sut = FetchStoriesWorker(storage: MockedStore())
  }
  
  // MARK: - Test doubles
  
  // MARK: - Tests
  
  func testSomething()
  {
    // Given
    
    // When
    
    // Then
  }
}
