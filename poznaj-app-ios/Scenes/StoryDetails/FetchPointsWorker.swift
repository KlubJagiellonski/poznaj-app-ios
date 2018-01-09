//
//  FetchPointsWorker.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 19.05.2017.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

class FetchPointsWorker {
    let storyId: UInt
    let storage: Store
    
    init(storyId: Int64, storage: Store) {
        self.storyId = UInt(storyId)
        self.storage = storage
    }
    
    func fetchPoints(_ completionHandler: @escaping(_ points:[Point], _ error: StoreError? ) -> ()){
        storage.fetchStoryPoints(for: Int(storyId), completionHandler: completionHandler)
    }
}
