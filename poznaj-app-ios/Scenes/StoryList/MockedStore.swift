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

class MockedStore : Store {
    func fetchStories(_ completionHandler: @escaping(_ stories:[Story], _ error: StoreError? ) -> ()) {
        completionHandler([
                    Story(id: 1, title: "Story 1", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dapibus tellus ipsum, et hendrerit est posuere nec. Suspendisse scelerisque nisl diam, a pretium tortor accumsan ut. Cras fringilla, felis ac mattis tincidunt, lectus purus scelerisque velit, ac fringilla ipsum nisl et nulla. Aenean venenatis at lacus sed malesuada. Morbi arcu felis, volutpat sit amet cursus non, egestas ac mi. In hac habitasse platea dictumst. Mauris volutpat leo nibh, et mollis dui vulputate id. Etiam placerat, lorem ultricies dapibus consequat, diam massa molestie sapien, sed hendrerit sem justo eu turpis. Quisque consectetur at dolor accumsan sodales. Etiam nec risus malesuada, sodales nisi dapibus, lacinia libero. Donec ultricies eleifend elit vel tincidunt. Nam sit amet massa eleifend, tristique arcu posuere, imperdiet mi. Maecenas ac elit eu velit pharetra euismod.", duration: Duration(string:"03:05")!, points:[
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 1", description: "Description 1", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 2", description: "Description 2", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 3", description: "Description 3", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 4", description: "Description 4", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 5", description: "Description 5", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 6", description: "Description 6", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 7", description: "Description 7", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 8", description: "Description 8", images:[])
                        ]),
                    Story(id: 2, title: "Story 2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dapibus tellus ipsum, et hendrerit est posuere nec. Suspendisse scelerisque nisl diam, a pretium tortor accumsan ut. Cras fringilla, felis ac mattis tincidunt, lectus purus scelerisque velit, ac fringilla ipsum nisl et nulla. Aenean venenatis at lacus sed malesuada. Morbi arcu felis, volutpat sit amet cursus non, egestas ac mi. In hac habitasse platea dictumst. Mauris volutpat leo nibh, et mollis dui vulputate id. Etiam placerat, lorem ultricies dapibus consequat, diam massa molestie sapien, sed hendrerit sem justo eu turpis. Quisque consectetur at dolor accumsan sodales. Etiam nec risus malesuada, sodales nisi dapibus, lacinia libero. Donec ultricies eleifend elit vel tincidunt. Nam sit amet massa eleifend, tristique arcu posuere, imperdiet mi. Maecenas ac elit eu velit pharetra euismod.", duration: Duration(string:"04:05")!, points:[
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 1", description: "Description 1", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 2", description: "Description 2", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 3", description: "Description 3", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 4", description: "Description 4", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 5", description: "Description 5", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 6", description: "Description 6", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 7", description: "Description 7", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 8", description: "Description 8", images:[])
                        ]),
                    Story(id: 3, title: "Story 3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dapibus tellus ipsum, et hendrerit est posuere nec. Suspendisse scelerisque nisl diam, a pretium tortor accumsan ut. Cras fringilla, felis ac mattis tincidunt, lectus purus scelerisque velit, ac fringilla ipsum nisl et nulla. Aenean venenatis at lacus sed malesuada. Morbi arcu felis, volutpat sit amet cursus non, egestas ac mi. In hac habitasse platea dictumst. Mauris volutpat leo nibh, et mollis dui vulputate id. Etiam placerat, lorem ultricies dapibus consequat, diam massa molestie sapien, sed hendrerit sem justo eu turpis. Quisque consectetur at dolor accumsan sodales. Etiam nec risus malesuada, sodales nisi dapibus, lacinia libero. Donec ultricies eleifend elit vel tincidunt. Nam sit amet massa eleifend, tristique arcu posuere, imperdiet mi. Maecenas ac elit eu velit pharetra euismod.", duration: Duration(string:"05:00")!, points:[
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 1", description: "Description 1", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 2", description: "Description 2", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 3", description: "Description 3", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 4", description: "Description 4", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 5", description: "Description 5", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 6", description: "Description 6", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 7", description: "Description 7", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 8", description: "Description 8", images:[])
                        ]),
                    Story(id: 4, title: "Story 4", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dapibus tellus ipsum, et hendrerit est posuere nec. Suspendisse scelerisque nisl diam, a pretium tortor accumsan ut. Cras fringilla, felis ac mattis tincidunt, lectus purus scelerisque velit, ac fringilla ipsum nisl et nulla. Aenean venenatis at lacus sed malesuada. Morbi arcu felis, volutpat sit amet cursus non, egestas ac mi. In hac habitasse platea dictumst. Mauris volutpat leo nibh, et mollis dui vulputate id. Etiam placerat, lorem ultricies dapibus consequat, diam massa molestie sapien, sed hendrerit sem justo eu turpis. Quisque consectetur at dolor accumsan sodales. Etiam nec risus malesuada, sodales nisi dapibus, lacinia libero. Donec ultricies eleifend elit vel tincidunt. Nam sit amet massa eleifend, tristique arcu posuere, imperdiet mi. Maecenas ac elit eu velit pharetra euismod.", duration: Duration(string:"02:25")!, points:[
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 1", description: "Description 1", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 2", description: "Description 2", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 3", description: "Description 3", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 4", description: "Description 4", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 5", description: "Description 5", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 6", description: "Description 6", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 7", description: "Description 7", images:[]),
                        Point(coordinate:CLLocationCoordinate2D(51.106753, 17.031984), title: "Title 8", description: "Description 8", images:[])
                        ])
            ], nil)
    }
}
