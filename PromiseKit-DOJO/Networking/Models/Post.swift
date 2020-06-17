//
//  Post.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 16/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userId, id: Int
    let title, body: String
}

