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
    let locatationManager = CLLocationManager()
    
    let map: MKMapView = {
        let map = MKMapView()
        map.showsCompass = true
        map.showsScale = true
        map.mapType = .standard
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupMap()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkingLocationEnabled()
    }
    
    func checkingLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkingAutorization()
        } else {
            showAlertLocation(title: "You have the geolocation service turned off",
                         message: "Do you want to turn it on?",
                         url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
        }
    }
    
    func setupLocationManager() {
        locatationManager.delegate = self
        locatationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkingAutorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            map.showsUserLocation = true
            locatationManager.startUpdatingLocation()
        case .denied:
            showAlertLocation(title: "You have disabled the location",
                              message: "Want to change it?",
                              url: URL(string: UIApplication.openSettingsURLString))
        case .notDetermined:
            locatationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    func showAlertLocation(title: String, message: String?, url: URL?) {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
        } else {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alert) in
                if let url = url {
                    UIApplication.shared.open(url)
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true)
        }
    }
}

extension MapForUserViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latitude = Double(userCoordinates?.latitude ?? "0"), let longitude = Double(userCoordinates?.longitude ?? "0") else { return }
        let sourceLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: sourceLocation, latitudinalMeters: 5000, longitudinalMeters: 5000)
        map.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = sourceLocation
        map.addAnnotation(pin)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkingAutorization()
    }
}

private extension MapForUserViewController {
    func setupMap() {
        view.addSubview(map)
        map.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        map.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}

