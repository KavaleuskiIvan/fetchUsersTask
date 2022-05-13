//
//  TableOfUsersViewController.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 21/01/2022.
//

import UIKit

class TableOfUsersViewController: UIViewController {
    
    var users: [User] = []
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSubviews()
        setupTableView()
        
        navigationItem.title = "randomuser.me"
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UsersInformationCell.self, forCellReuseIdentifier: UsersInformationCell.identifier)
        
        gettingUsers()
        
        setupRefreshControl()
    }
    
    func setupRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Updating")
        refreshControl.addTarget(self, action: #selector(updateTable), for: .valueChanged)
    }
    @objc func updateTable() {
        gettingUsers()
        refreshControl.endRefreshing()
    }
    
    func gettingUsers() {
        GettingUsersController.shared.getUsers() { [weak self] (result) in
            switch result {
            case .success(let user):
                self?.users = user
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let requestError):
                switch requestError {
                case .invalidUrl:
                    print("Error: Invalid URL detected")
                case .errorDecode:
                    print("Error: Decode problem. Check the JSON data")
                case .failedRequest:
                    print("Error: Failed Request")
                case .unknownError:
                    print("Error: Unknown")
                }
            }
        }
    }
}

extension TableOfUsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersInformationCell.identifier, for: indexPath) as! UsersInformationCell
        let user = users[indexPath.row]
        cell.usersName.text = user.name.first.capitalized + " " + user.name.last.capitalized
        guard let imageData = try? Data(contentsOf: user.picture.medium) else { fatalError() }
        cell.usersPhoto.image = UIImage(data: imageData)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let UsersInformationVC = UsersInformationViewController()
        UsersInformationVC.userInformation = users[indexPath.row]
        navigationController?.pushViewController(UsersInformationVC, animated: true)
    }
}

private extension TableOfUsersViewController {
    func addSubviews() {
        view.addSubview(tableView)
    }
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

