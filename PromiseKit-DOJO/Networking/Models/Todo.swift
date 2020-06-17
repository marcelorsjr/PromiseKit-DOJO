//
//  Todo.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 17/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Todo: Codable {
    let userId, id: Int
    let title: String
    let completed: Bool
}

