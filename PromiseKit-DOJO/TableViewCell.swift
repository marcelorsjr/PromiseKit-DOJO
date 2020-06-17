//
//  TableViewCell.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 16/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, Reusable {

    let postsService: PostsService = PostsServiceImpl()
    let albumsService: AlbumsService = AlbumsServiceImpl()

    var posts: [Post] = []
    var albums: [Album] = []

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var postsQuantityLabel: UILabel!
    @IBOutlet private weak var albumsQuantityLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    func setup(withUser user: User) {
        userNameLabel.text = user.name
    }

    private func setupPostsAndAlbums(fromUser user: User) {

    }

}
