//
//  AddItemViewController.swift
//  NRTodo
//
//  Created by Nino Rorudan on 1/21/18.
//  Copyright © 2018 The NTMC Foundation. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class AddItemViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtSubtitle: UITextField!

    @IBOutlet weak var myMapView: MKMapView!
    
    var location = CLLocation()
   
    @IBAction func btnAddItem(_ sender: Any)
    {
        if txtTitle.text != "" && txtSubtitle.text != ""
        {
            
        }
    }
    
    let manager = CLLocationManager()
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        myMapView.setRegion(region, animated: true)
        myMapView.showsUserLocation = true
        
    }
    

    func saveThis(title:String, subtitle:String, coordinates:String)
    {
        //core data boilerplate
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "NRTodo", into: context)
        
        newItem.setValue(title, forKey: "title")
        newItem.setValue(subtitle, forKey: "subtitle")
        newItem.setValue(coordinates, forKey: "coordinates")
        
        do
        {
            try context.save()
            print("Saved")
        }
        catch
        {
            print("Error encountered")
        }
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
