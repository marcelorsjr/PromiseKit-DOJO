//
//  UsersService.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 17/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import Foundation
import PromiseKit

protocol UsersService {
    func users() -> Promise<[User]>
}

class UsersServiceImpl: UsersService {

    let apiClient: APIClient

    init(apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }

    func users() -> Promise<[User]> {
        let endpoint = UsersEndpoint()
        return apiClient.request(endpoint)
    }
}
