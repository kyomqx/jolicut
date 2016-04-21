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

class mapViewController: UIViewController {
    
    
    class ViewController: UIViewController, CLLocationManagerDelegate
    {
        
        @IBOutlet weak var map: MKMapView!
        
        let locationManager = CLLocationManager()
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            
            self.map.mapType = MKMapType.Standard
            self.map.showsUserLocation = true
            
            self.map.removeAnnotations(self.map.annotations)
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
            let location = self.locationManager.location
            
            var latitude: Double = location!.coordinate.latitude
            var longitude: Double = location.coordinate.longitude
            
        }
        
        override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            
        }
        
        func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
        {
            //-
            
            let location = locations.last as! CLLocation
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            
            self.map.setRegion(region, animated: true)
            
            
            // Add an annotation on Map View
            var point: MKPointAnnotation! = MKPointAnnotation()
            
            point.coordinate = location.coordinate
            point.title = "Current Location"
            point.subtitle = "sub title"
            
            self.map.addAnnotation(point)
            
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
        }

}
