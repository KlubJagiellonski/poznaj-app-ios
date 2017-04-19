//
//  StoryListViewControllerTests.swift
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

class StoryListViewControllerOutputSpy : StoryListRequestBoundary {

  var fetched = false

  func fetchStories() {
    fetched = true
  }

}

class StoryListViewControllerTests: XCTestCase
{
  // MARK: - Subject under test
  
  var sut: StoryListViewController!
  var window: UIWindow!
  
  // MARK: - Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupStoryListViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: - Test setup
  
  func setupStoryListViewController()
  {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.init(for: StoryListViewController.self))
    sut = storyboard.instantiateViewController(withIdentifier: "StoryListViewController") as! StoryListViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: - Test doubles
  
  // MARK: - Tests
  
  func testFetchStoriesOnViewDidLoad()
  {
    // Given
    let spy = StoryListViewControllerOutputSpy()
    sut.output = spy
    // When
    loadView()

    // Then
    XCTAssert(spy.fetched)
  }
}
