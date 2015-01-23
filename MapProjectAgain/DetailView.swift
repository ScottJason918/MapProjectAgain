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
            mapTitleLabel.text = "All Businesses";
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1);
            let region = MKCoordinateRegionMake(myArray[0].busLoc, span);
            
            locationManager.requestWhenInUseAuthorization();
            theMap.region = region;
        }
    }

    override func viewWillAppear(animated: Bool) {
        if myArray.count == 0{
            
            var pin : MKPointAnnotation = MKPointAnnotation();
            pin.coordinate = business.busLoc;
            pin.title = business.busName;
            pin.subtitle = business.busSub;
            
            theMap.addAnnotation(pin);
        }else{
            mapTitleLabel.text = "All Businesses";
            for var i = 0; i < myArray.count; ++i{
                theMap.showAnnotations(theMap.annotations, animated:true)
                var pin : MKPointAnnotation = MKPointAnnotation();

                pin.coordinate = myArray[i].busLoc;
                pin.title = myArray[i].busName;
                pin.subtitle = myArray[i].busSub;
                theMap.addAnnotation(pin);
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
