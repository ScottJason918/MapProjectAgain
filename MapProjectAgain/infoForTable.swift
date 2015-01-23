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
    var busName : String = "";

    var busLoc : CLLocationCoordinate2D;
    var busSub : String = "";
    
    init(busLoc : CLLocationCoordinate2D)
    {
        self.busLoc = busLoc;

    }
}
