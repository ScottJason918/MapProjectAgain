//
//  DetailView.swift
//  MapProject
//
//  Created by Jason Scott on 1/19/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import UIKit
import MapKit


class DetailView: UIViewController {
    
    
    @IBOutlet weak var mapTitleLabel: UILabel!
    @IBOutlet weak var theMap: MKMapView!
    
    var business:TableInfo!
    var myArray : [TableInfo] = [];
    
    let locationManager : CLLocationManager = CLLocationManager();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if myArray.count == 0{
            
            mapTitleLabel.text = business.busName;
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1);
            let region = MKCoordinateRegionMake(business.busLoc, span);
            
            locationManager.requestWhenInUseAuthorization();
            theMap.region = region;
            
            
            // Do any additional setup after loading the view.
        }else{
            println(business.busLoc);
        }
    }
    
    ///Setting Annotations
    override func viewWillAppear(animated: Bool) {
        if myArray.count == 0{
            
            var pin : MKPointAnnotation = MKPointAnnotation();
            pin.coordinate = business.busLoc;
            pin.title = business.busName;
            pin.subtitle = business.busSub;
            
            theMap.addAnnotation(pin);
        }else{
            mapTitleLabel.text = "All Bussinesses";
            for var i = 0; i < myArray.count; ++i{
                var pin : MKPointAnnotation = MKPointAnnotation();
                
                pin.coordinate = business.busLoc;
                pin.title = business.busName;
                pin.subtitle = business.busSub;
                
                theMap.addAnnotation(pin);
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
