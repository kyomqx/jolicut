//
//  mapViewController.swift
//  Jolicut
//
//  Created by Max KHAMVONGSA on 21/04/16.
//  Copyright © 2016 Max KHAMVONGSA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    var myLocations: [CLLocation] = []
    
    //static var on = false
    
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy =   kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.mapType = MKMapType.Standard
        mapView.showsUserLocation = true
        
        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            myLocations.append(locations[0])
            let spanX = 0.007
            
            let spanY = 0.007
            
            let newRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
            
            mapView.setRegion(newRegion, animated: true)
        }
    }
    
}
