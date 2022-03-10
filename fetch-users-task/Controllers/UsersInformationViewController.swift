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
    var userName: UILabel = {
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
        view.backgroundColor = .white
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
         addButton.image = UIImage(named: "map")
         self.navigationItem.rightBarButtonItem = addButton
    }
    @objc func didTapMapButton() {
        let MapForUserVC = MapForUserViewController()
        MapForUserVC.userCoordinates = userInformation?.location.coordinates
        navigationController?.pushViewController(MapForUserVC, animated: true)
    }
}
