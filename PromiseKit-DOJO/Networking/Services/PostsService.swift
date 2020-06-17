//
//  PostsService.swift
//  QuizChallenge
//
//  Created by m.dos.santos.junior on 27/08/19.
//

import Foundation
import PromiseKit

protocol PostsService {
    func posts(userId: String) -> Promise<[Post]>
}

class PostsServiceImpl: PostsService {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }
    
    func posts(userId: String) -> Promise<[Post]> {
        let endpoint = PostsEndpoint()
        return apiClient.request(endpoint)
    }
}
