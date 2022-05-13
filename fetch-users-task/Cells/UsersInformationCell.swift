//
//  UsersInformationCell.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 21/01/2022.
//

import UIKit

class UsersInformationCell: UITableViewCell {
    
    static let identifier = "cell"
    let viewForCell: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let usersName: UILabel = {
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
        
        addSubviews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UsersInformationCell {
    func addSubviews() {
        contentView.addSubview(viewForCell)
        viewForCell.addSubview(usersName)
        viewForCell.addSubview(usersPhoto)
    }
    func addCornerRadius(name: UIView) {
        name.layoutIfNeeded()
        name.layer.cornerRadius = name.frame.height/5
        name.layer.masksToBounds = true
    }
    func setupConstraints() {
        
        viewForCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        viewForCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        viewForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        viewForCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        addCornerRadius(name: viewForCell)
        
        usersName.leadingAnchor.constraint(equalTo: viewForCell.leadingAnchor, constant: 20).isActive = true
        usersName.topAnchor.constraint(equalTo: viewForCell.topAnchor, constant: 5).isActive = true
        usersName.bottomAnchor.constraint(equalTo: viewForCell.bottomAnchor, constant: -5).isActive = true
        let constr = usersName.widthAnchor.constraint(equalTo: viewForCell.widthAnchor, multiplier: 4/6)
        constr.isActive = true
        constr.priority = .defaultLow
        addCornerRadius(name: usersName)
        
        usersPhoto.leftAnchor.constraint(equalTo: usersName.rightAnchor, constant: 10).isActive = true
        usersPhoto.bottomAnchor.constraint(equalTo: viewForCell.bottomAnchor, constant: -10).isActive = true
        usersPhoto.rightAnchor.constraint(equalTo: viewForCell.rightAnchor, constant: -10).isActive = true
        usersPhoto.widthAnchor.constraint(equalToConstant: 80).isActive = true
        usersPhoto.topAnchor.constraint(equalTo: viewForCell.topAnchor, constant: 10).isActive = true
        addCornerRadius(name: usersPhoto)
    }
}
