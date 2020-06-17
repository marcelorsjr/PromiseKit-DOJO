//
//  TodosService.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 17/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import Foundation
import PromiseKit

protocol TodosService {
    func todos(userId: Int) -> Promise<[Todo]>
}

class TodosServiceImpl: TodosService {

    let apiClient: APIClient

    init(apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }

    func todos(userId: Int) -> Promise<[Todo]> {
        let endpoint = TodosEndpoint()
        return apiClient.request(endpoint)
    }
}

