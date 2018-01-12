//
//  ViewController.swift
//  NRTodo
//
//  Created by Nino Rorudan on 1/12/18.
//  Copyright © 2018 The NTMC Foundation. All rights reserved.
//

import UIKit
import CoreData

var titles:[String] = []
var subtitles:[String] = []
var coordinates:[String] = []


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //saveThis(title: "Trello", subtitle: "Trello", coordinates: "Trello")
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func getThis()
    {
        //core data boilerplate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NRTodo")
        
        do
        {
            let results = try context.fetch(request)
            
            //clean the arrays
            titles.removeAll()
            subtitles.removeAll()
            coordinates.removeAll()
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let myTitle = result.value(forKey: "title") as? String
                    {
                        titles.append(myTitle)
                    }
                    else
                    {
                        titles.append(" ")
                    }
                    
                    
                    if let mySubtitle = result.value(forKey: "subtitle") as? String
                    {
                        subtitles.append(mySubtitle)
                    }
                    else
                    {
                        subtitles.append(" ")
                    }
                    
                    if let myCoordinates = result.value(forKey: "coordinates") as? String
                    {
                        coordinates.append(myCoordinates)
                    }
                    else
                    {
                        coordinates.append(" ")
                    }
                }
            }
        
        }
        catch
        {
            print("Error retrieving data")
        }
        
        

    }


}

