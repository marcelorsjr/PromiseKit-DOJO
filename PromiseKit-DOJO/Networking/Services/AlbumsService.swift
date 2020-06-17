//
//  AlbumsService.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 17/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import Foundation
import PromiseKit

protocol AlbumsService {
    func albums(userId: String) -> Promise<[Album]>
}

class AlbumsServiceImpl: AlbumsService {

    let apiClient: APIClient

    init(apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }

    func albums(userId: String) -> Promise<[Album]> {
        let endpoint = AlbumsEndpoint()
        return apiClient.request(endpoint)
    }
}

