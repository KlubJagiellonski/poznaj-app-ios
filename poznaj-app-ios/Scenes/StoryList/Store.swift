//
//  Store.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 14.02.2017.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

protocol Store {
    func fetchStories(completionHandler: @escaping(_ stories:[Story], _ error: StoreError? ) -> ()) -> ()
    func fetchStoryDetails(id: UInt,completionHandler: @escaping(_ points:[Point], _ error: StoreError? ) -> ()) -> ()
    func fetchImageURL(id: UInt, completionHandler: @escaping(_ image: Image, _ error: StoreError? ) -> ()) -> ()
}

enum StoreError: Equatable, Error
{
    case cannotFetch(String)
}

func ==(lhs: StoreError,rhs: StoreError) -> Bool{
    switch (lhs,rhs) {
    case (.cannotFetch(let l),.cannotFetch(let r)) where l == r: return true
    default: return false
    }
}

