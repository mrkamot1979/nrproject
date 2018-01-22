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

class AddItemViewController: UIViewController, CLLocationManagerDelegate {
    
    
        

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
