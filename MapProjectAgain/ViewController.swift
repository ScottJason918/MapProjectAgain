//
//  ViewController.swift
//  MapProject
//
//  Created by Jason Scott on 1/17/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBAction func goBack(segue: UIStoryboardSegue) {
        
    }
    
    
    var myArray : [TableInfo] = [];
    @IBOutlet weak var allBusinessButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Business Information
        
        var business1 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.666706, longitude: -112.12828));
        business1.busName = "New Bacon-ings";
        business1.busSub = "Bacon based foods";
        
        var business2 : TableInfo = TableInfo(busLoc : CLLocationCoordinate2D(latitude: 33.62134, longitude: -112.118708));
        business2.busName = "Never Been Feta";
        business2.busSub = "Greek food";
        
        var business3 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.666028, longitude: -112.120867));
        business3.busName = "Mission A Corn Plished";
        business3.busSub = "Vegetarian friendly menu";
        
        var business4 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.666278, longitude: -112.118305));
        business4.busName = "Fig-eta Bout It";
        business4.busSub = "Fruity";
        
        var business5 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.678099, longitude: -112.119923));
        business5.busName = "Chevre Which Way but Loose";
        business5.busSub = "We're funny";
        
        var business6 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.659563, longitude: -112.115674));
        business6.busName = "Tunami";
        business6.busSub = "Seafood";
        
        var business7 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.674850, longitude: -112.107778));
        business7.busName = "These Collards Don't Run";
        business7.busSub = "Greens are good";
        
        var business8 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.648631, longitude: -112.144428));
        business8.busName = "Totally Rad-ish";
        business8.busSub = "Gotta love veggies";
        
        var business9 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.646537, longitude: -112.127262));
        business9.busName = "Last of the Mojicama";
        business9.busSub = "Respectfully good";
        
        var business10 : TableInfo = TableInfo(busLoc: CLLocationCoordinate2D(latitude: 33.665899, longitude: -112.115586));
        business10.busName = "Hit Me With Your Best Shallot";
        business10.busSub = "Rockin out while eating";
        
        //Adding to Array
        myArray.append(business1);
        myArray.append(business2);
        myArray.append(business3);
        myArray.append(business4);
        myArray.append(business5);
        myArray.append(business6);
        myArray.append(business7);
        myArray.append(business8);
        myArray.append(business9);
        myArray.append(business10);
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count;
    }
    ///Populating Cells with information from Array
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : theCell = tableView.dequeueReusableCellWithIdentifier("cellPrime") as theCell;
        
        let currentSelection : TableInfo = myArray[indexPath.row];
        
        cell.cellLabel!.text = currentSelection.busName;
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cellSegue" {
            var detailView : DetailView = segue.destinationViewController as DetailView;
            var indexPath : NSIndexPath? = myTable.indexPathForSelectedRow();
            
            let currentSelection : TableInfo = myArray[indexPath!.row];
            detailView.business = currentSelection;
        }
        if segue.identifier == "buttonSegue"{
            var detailView : DetailView = segue.destinationViewController as DetailView;
            detailView.myArray = myArray;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

