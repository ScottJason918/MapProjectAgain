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
    
    /// instead of replicating the variables in your business object, just send the whole business object
    //////// var business:TableInfo!
    /// make sure to add "!" so you don't have to declare it up here, meaning it's technically optional
    // then just pass this single variable from your segue. There is less opportunity for mistakes.
    // you'll use dot notation "business.busName" to reference it (similar to the array) instead  of these varaibles.

    var busName : String = "";
    var busLoc : CLLocationCoordinate2D!;
    var busSub : String = "";
    var myArray = []; //this array needs to be declared as an array of your object
    // var myArray:[TableInfo] = []
    //that way your be sure all the information is passed through, I think this is your problem
    
    let locationManager : CLLocationManager = CLLocationManager();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if myArray.count == 0{
            
            mapTitleLabel.text = busName;
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1);
            let region = MKCoordinateRegionMake(busLoc, span);
            
            locationManager.requestWhenInUseAuthorization();
            theMap.region = region;
            
            
            // Do any additional setup after loading the view.
        }else{
            println(myArray);
        }
    }
    
    ///Setting Annotations
    // I would recommend  makint two separate view contoller files instead of having them in one.
    // it makes it easier and keeps your code separate.
    
    override func viewWillAppear(animated: Bool) {
        if myArray.count == 0{
            
            var pin : MKPointAnnotation = MKPointAnnotation();
            pin.coordinate = busLoc;
            pin.title = busName;
            pin.subtitle = busSub;
            
            theMap.addAnnotation(pin);
        }else{
            mapTitleLabel.text = "All Bussinesses";
            for var i = 0; i > myArray.count; ++i{
                var pin : MKPointAnnotation = MKPointAnnotation();
               // pin.coordinate = myArray[i].busLoc; //i tlooks like this was commented out? that might be the problem. lol
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
