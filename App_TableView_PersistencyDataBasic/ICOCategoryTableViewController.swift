//
//  ICOCategoryTableViewController.swift
//  App_TableView_PersistencyDataBasic
//
//  Created by User on 12/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

class ICOCategoryTableViewController: UITableViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var nombreCategoriaSeleccionada = ""
    
    var seleccionIndexPath = NSIndexPath()
    
    
    var listadoCategorias = ["Tienda de Apple", "Bar", "Tienda de Libros", "Club", "Mercadona", "Museos", "Helados", "Peluquería", "Parque Rey Juan Carlos","Sin Categoria"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<listadoCategorias.count{
            
            if listadoCategorias[index] == nombreCategoriaSeleccionada{
                
                seleccionIndexPath = NSIndexPath(forRow: index, inSection: 0)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return listadoCategorias.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        
        
        let nombreDeCategoria = listadoCategorias[indexPath.row]
        cell.textLabel?.text = nombreDeCategoria
        
        
        if nombreDeCategoria == nombreCategoriaSeleccionada{
            
            cell.accessoryType = .Checkmark
            
        }else{
            
            cell.accessoryType = .None
        }

        return cell
    }


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row != seleccionIndexPath.row{
            
            if let nuevaCellSelect = tableView.cellForRowAtIndexPath(indexPath){
                
                nuevaCellSelect.accessoryType = .Checkmark
                
            }
            
            if let antiguaCellSelect = tableView.cellForRowAtIndexPath(seleccionIndexPath){
                
                antiguaCellSelect.accessoryType = .None
            }
            
            seleccionIndexPath = indexPath
            
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "passInformationToTareas"{
        
            let cell = sender as! UITableViewCell
            
            if let indexPath = tableView.indexPathForCell(cell){
                
                nombreCategoriaSeleccionada = listadoCategorias[indexPath.row]
                
            }
        }
    }
    
    
    
}
