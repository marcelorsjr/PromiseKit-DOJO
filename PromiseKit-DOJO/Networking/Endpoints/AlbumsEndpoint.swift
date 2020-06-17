//
//  AlbumsEndpoint.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 17/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import Foundation

class AlbumsEndpoint: Endpoint {
    var baseUrl: URL {
        get {
            guard let url = URL(string: Constants.api.baseURL) else {
                fatalError("Error creating baseURL with: \(Constants.api.baseURL)")
            }
            return url
        }
    }

    lazy var fullPath: URL = {
        return baseUrl.appendingPathComponent(path)
    }()

    var method: MethodHTTP = .get

    var path: String = Constants.api.endpointsPath.albums

    var parameters: [String : Any]?

    var headers: [String : String]?
}

