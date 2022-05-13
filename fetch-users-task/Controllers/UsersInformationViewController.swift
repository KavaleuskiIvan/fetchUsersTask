//
//  UsersInformationViewController.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 21/01/2022.
//

import UIKit

class UsersInformationViewController: UIViewController {
    
    var userInformation:User?
    
    // MARK: UpperView
    let upperView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userPhoto: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: LowerView
    let lowerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: LeftStackView For LowerView
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "phone:"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "gender:"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "email:"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nationalityLabel: UILabel = {
        let label = UILabel()
        label.text = "nationality:"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let leftStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.alignment = .center
        stackview.spacing = 5
        return stackview
    }()
    
    // MARK: RightStackView For LowerView
    let enteredPhoneLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enteredGenderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enteredEmailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enteredNationalityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.alignment = .trailing
        stackview.spacing = 5
        return stackview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationItems()
        
        addingSubviews()
        setupConstarints()
        
        setupLabels()
    }
    func setupLabels() {
        guard let userInformation = userInformation else { return }
        userName.text = userInformation.name.first + " " + userInformation.name.last
        enteredPhoneLabel.text = userInformation.phone
        enteredGenderLabel.text = userInformation.gender
        enteredEmailLabel.text = userInformation.email
        enteredNationalityLabel.text = userInformation.nat
        guard let imageData = try? Data(contentsOf: (userInformation.picture.medium)) else { fatalError() }
        userPhoto.image = UIImage(data: imageData)
    }
    func setupNavigationItems() {
         let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapMapButton))
         self.navigationItem.rightBarButtonItem = addButton
    }
    @objc func didTapMapButton() {
        let MapForUserVC = MapForUserViewController()
        MapForUserVC.userCoordinates = userInformation?.location.coordinates
        navigationController?.pushViewController(MapForUserVC, animated: true)
    }
}

private extension UsersInformationViewController {
    func addingSubviews() {
        view.addSubview(upperView)
        view.addSubview(lowerView)
        upperView.addSubview(userName)
        upperView.addSubview(userPhoto)
        lowerView.addSubview(leftStackView)
        lowerView.addSubview(rightStackView)
        addingSubviewsForStackViews()
    }
    func addingSubviewsForStackViews() {
        leftStackView.addArrangedSubview(phoneLabel)
        leftStackView.addArrangedSubview(genderLabel)
        leftStackView.addArrangedSubview(emailLabel)
        leftStackView.addArrangedSubview(nationalityLabel)
        
        rightStackView.addArrangedSubview(enteredPhoneLabel)
        rightStackView.addArrangedSubview(enteredGenderLabel)
        rightStackView.addArrangedSubview(enteredEmailLabel)
        rightStackView.addArrangedSubview(enteredNationalityLabel)
    }
    func addCornerRadius(name: UIView) {
        name.layoutIfNeeded()
        name.layer.cornerRadius = name.frame.height/20
        name.layer.masksToBounds = true
    }
    func setupConstarints(){
        // Constarints of upperView
        upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        upperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        upperView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        addCornerRadius(name: upperView)
        
        userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        userName.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 5).isActive = true
        userName.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -5).isActive = true
        let constr = userName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/6)
        constr.isActive = true
        constr.priority = .defaultLow
        
        userPhoto.leftAnchor.constraint(equalTo: userName.rightAnchor, constant: 12).isActive = true
        userPhoto.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -12).isActive = true
        userPhoto.rightAnchor.constraint(equalTo: upperView.rightAnchor, constant: -12).isActive = true
        userPhoto.widthAnchor.constraint(equalToConstant: 80).isActive = true
        userPhoto.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 12).isActive = true
        
        // Constraints of lowerView
        lowerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 20).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        lowerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        addCornerRadius(name: lowerView)
        
        // Constarints to leftStackView
        leftStackView.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 10).isActive = true
        leftStackView.widthAnchor.constraint(equalTo: lowerView.widthAnchor, multiplier: 1/4).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 12).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -10).isActive = true
        
        // Constarints to labels in leftStackView
        phoneLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        genderLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        nationalityLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        
        // Constarints to rightStackView
        rightStackView.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 10).isActive = true
        rightStackView.widthAnchor.constraint(equalTo: lowerView.widthAnchor, multiplier: 3/4).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: -10).isActive = true
        // Constarints to labels in leftStackView
        enteredPhoneLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
        enteredGenderLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
        enteredEmailLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
        enteredNationalityLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
    }
}

