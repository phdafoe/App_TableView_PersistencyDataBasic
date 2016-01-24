//
//  ICOListadoTareasTableViewController.swift
//  App_TableView_PersistencyDataBasic
//
//  Created by User on 12/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

//MARK: - VARIABLES EXTERNAS
var myListTask = [String]()
var myListDescription = [String]()
var myListPriority = [String]()
var myListPhoto = [NSData]()
var myListCategory = [String]()


class ICOListadoTareasTableViewController: UITableViewController {
    


    //MARK: - IBOUTLET
    
    @IBOutlet var myTableViewList: UITableView!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myListTask = NSUserDefaults.standardUserDefaults().objectForKey("miListaDeTareas") as! [String]
        myListDescription = NSUserDefaults.standardUserDefaults().objectForKey("miDescripcionDeTarea") as! [String]
        myListPriority = NSUserDefaults.standardUserDefaults().objectForKey("miPrioridadDeLista") as! [String]
        myListCategory = NSUserDefaults.standardUserDefaults().objectForKey("miNuevaCategoria") as! [String]
        
        myListPhoto = NSUserDefaults.standardUserDefaults().objectForKey("miPhoto") as! [NSData]
        
        
        self.title = "Lista de tareas"
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0

    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)

        myTableViewList.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return myListTask.count
    }
    
    //MARK: - UTILS
    
    
    
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let customCell : ICOCustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ICOCustomCell
        
        let image : UIImage = UIImage(data: myListPhoto[indexPath.row])!
        
        customCell.myTask.text = myListTask[indexPath.row]
        customCell.myPriority.text = myListPriority[indexPath.row]
        customCell.myDescription.text = myListDescription[indexPath.row]
        customCell.myCategory.text = myListCategory[indexPath.row]
        customCell.myCustomImageView.image = image

        return customCell
    }
    

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let icoDetalVC = self.storyboard?.instantiateViewControllerWithIdentifier("icoDetail") as! ICODetailViewController
       
        //IMAGEN
        let image : UIImage = UIImage(data: myListPhoto[indexPath.row])!
        
        icoDetalVC.dataTask = myListTask[indexPath.row]
        icoDetalVC.dataDescription = myListDescription[indexPath.row]
        icoDetalVC.dataPriority = myListPriority[indexPath.row]
        
        
        //IMAGEN
        icoDetalVC.dataImage = image
    
        navigationController?.pushViewController(icoDetalVC, animated: true)
        
        print("Esta siendo seleccionado \(myListTask[indexPath.row]) \n \(myListDescription[indexPath.row]) \n \(myListPriority[indexPath.row])")
        
   
        
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            
        
        if editingStyle == .Delete {
            
            myListTask.removeAtIndex(indexPath.row)
            myListPriority.removeAtIndex(indexPath.row)
            myListDescription.removeAtIndex(indexPath.row)
            myListPhoto.removeAtIndex(indexPath.row)
            myListCategory.removeAtIndex(indexPath.row)
            

            NSUserDefaults.standardUserDefaults().setObject(myListTask, forKey: "miListaDeTareas")
            NSUserDefaults.standardUserDefaults().setObject(myListDescription, forKey: "miDescripcionDeTarea")
            NSUserDefaults.standardUserDefaults().setObject(myListPriority, forKey: "miPrioridadDeLista")
            NSUserDefaults.standardUserDefaults().setObject(myListPhoto, forKey: "miPhoto")
            NSUserDefaults.standardUserDefaults().setObject(myListCategory, forKey: "miNuevaCategoria")
            
            myTableViewList.reloadData()
            
        }
    }
    
}




