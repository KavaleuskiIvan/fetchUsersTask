//
//  MapForUserViewControllerConstraints.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 22/01/2022.
//

import Foundation

extension MapForUserViewController {
    func setupMap() {
        view.addSubview(map)
        map.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        map.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}
