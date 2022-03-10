//
//  UsersInformationViewControllerConstraints.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 21/01/2022.
//

import Foundation
import UIKit

extension UsersInformationViewController {
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
        userPhoto.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userPhoto.heightAnchor.constraint(equalToConstant: 100).isActive = true
        userPhoto.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 12).isActive = true
        
        // Constraints of lowerView
        lowerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        lowerView.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 20).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        lowerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        addCornerRadius(name: lowerView)
        
        // Constarints to leftStackView
        leftStackView.topAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
        leftStackView.widthAnchor.constraint(equalTo: lowerView.widthAnchor, multiplier: 1/4).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 12).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor).isActive = true
        // Constarints to labels in leftStackView
        phoneLabel.heightAnchor.constraint(equalTo: leftStackView.heightAnchor, multiplier: 1/4).isActive = true
        phoneLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        
        genderLabel.heightAnchor.constraint(equalTo: leftStackView.heightAnchor, multiplier: 1/4).isActive = true
        genderLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        
        emailLabel.heightAnchor.constraint(equalTo: leftStackView.heightAnchor, multiplier: 1/4).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        
        nationalityLabel.heightAnchor.constraint(equalTo: leftStackView.heightAnchor, multiplier: 1/4).isActive = true
        nationalityLabel.widthAnchor.constraint(equalTo: leftStackView.widthAnchor).isActive = true
        
        // Constarints to rightStackView
        rightStackView.topAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
        rightStackView.widthAnchor.constraint(equalTo: lowerView.widthAnchor, multiplier: 3/4).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -12).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor).isActive = true
        // Constarints to labels in leftStackView
        enteredPhoneLabel.heightAnchor.constraint(equalTo: rightStackView.heightAnchor, multiplier: 1/4).isActive = true
        enteredPhoneLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
        
        enteredGenderLabel.heightAnchor.constraint(equalTo: rightStackView.heightAnchor, multiplier: 1/4).isActive = true
        enteredGenderLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
        
        enteredEmailLabel.heightAnchor.constraint(equalTo: rightStackView.heightAnchor, multiplier: 1/4).isActive = true
        enteredEmailLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
        
        enteredNationalityLabel.heightAnchor.constraint(equalTo: rightStackView.heightAnchor, multiplier: 1/4).isActive = true
        enteredNationalityLabel.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
    }
}
