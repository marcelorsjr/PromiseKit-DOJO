//
//  ViewController.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 16/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ActivityIndicatorProtocol {

    @IBOutlet weak var tableView: UITableView!

    let usersService: UsersService = UsersServiceImpl()
    let todosService: TodosService = TodosServiceImpl()

    var users: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()

        self.loadUsers()
    }

    func loadUsers() {

    }

    func setupTableView() {
        self.tableView.rowHeight = 100
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(for: indexPath, cellType: TableViewCell.self)
        let user = users[indexPath.row]
        cell.setup(withUser: user)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

