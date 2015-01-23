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
    var busLoc : CLLocationCoordinate2D!; // I think the problem you are running into might have somethint to do with using the "!"
    // you are declaring that it is optional, optional variables need to always have the "!" in every reference. so in your other detailView code, you need to include it
    
    //I would recommend not using it as optional, since technically you will always require it. 
    // in order to not get the error that it hasn't been initialized, you should initialize it in the "init" function by accpeting a variable
    var busSub : String = "";
    
    init() // accept CLLocationCoordinate2D variable here init(CLLocationCoordinate2D variable) instead of init()
    { 
        // and apply that variable to using self.busLoc = variable
        //that way you avoid having to make it optional
    }
}
