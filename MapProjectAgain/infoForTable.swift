//
//  infoForTable.swift
//  MapProject
//
//  Created by Jason Scott on 1/20/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//


import UIKit
import MapKit

//File Holding information for cells

class TableInfo
{
    ///Blank variables to receive information
    var busName : String = "";
    var busLoc : CLLocationCoordinate2D;
    var busSub : String = "";
    
    //receiving information from ViewController with coordinate information to add to array
    init(busLoc : CLLocationCoordinate2D)
    {
        self.busLoc = busLoc;

    }
}
