//
//  UsersInformationCell.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 21/01/2022.
//

import UIKit

class UsersInformationCell: UITableViewCell {
    
    static let identifier = "cell"
    var viewForCell: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var usersName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let usersPhoto: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubviews()
        setupConstraints()
    }
    
}
