//
//  detailViewController.swift
//  NRTodo
//
//  Created by Nino Rorudan on 1/24/18.
//  Copyright © 2018 The NTMC Foundation. All rights reserved.
//

import UIKit
import MapKit

class detailViewController: UIViewController {

    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSubtitle: UILabel!
    @IBOutlet weak var detailMap: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        txtTitle.text = titles[thisItem]
        txtSubtitle.text = subtitles[thisItem]
        
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
