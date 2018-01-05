//
//  FetchImageWorker.swift
//  poznaj-app-ios
//
//  Created by Daniel Stokowski on 22.05.2017.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation

class FetchImageWorker {
    let id: UInt
    let storage: Store
    
    init(id: UInt, storage: Store) {
        self.id = id
        self.storage = storage
    }
    
    func fetchImage(_ completionHandler: @escaping(_ image:Image, _ error: StoreError? ) -> ()){
        storage.fetchImageURL(id: id, completionHandler: completionHandler)
    }
}
