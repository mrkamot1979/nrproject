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

var thisItem:Int = 0


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTableView: UITableView!
    
    //number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        cell.detailTextLabel?.text = subtitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            thisItem = indexPath.row
        }
    }
    
    
    func deleteThis()
    {
        print ("testing \(titles[0])")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getThis()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //saveThis(title: "Trello", subtitle: "Trello", coordinates: "Trello")
        //saveThis(title:"Test getthis()", subtitle: "See if getthis retrieves information", coordinates: "22")
        //getThis()
        
        
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
        myTableView.reloadData()
        }
        catch
        {
            print("Error retrieving data")
        }
        
        

    }


}

