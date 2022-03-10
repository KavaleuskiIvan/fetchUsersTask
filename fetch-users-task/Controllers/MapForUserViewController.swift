//
//  MapForUserViewController.swift
//  fetch-users-task
//
//  Created by Kavaleuski Ivan on 22/01/2022.
//

import UIKit
import MapKit

class MapForUserViewController: UIViewController {
    
    var userCoordinates: Coordinates?
    
    let map: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMap()
        setupCoordinatesOfPlacemark()
    }
    func setupCoordinatesOfPlacemark() {
        guard let latitude = Double(userCoordinates!.latitude), let longitude = Double(userCoordinates!.longitude) else { return }
        let sourceLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: sourceLocation, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        let sourceAnnotation = MKPointAnnotation()
        if let location = sourcePlacemark.location {
              sourceAnnotation.coordinate = location.coordinate
            }
        self.map.showAnnotations([sourceAnnotation], animated: true)
        map.setRegion(region, animated: true)
    }
}
