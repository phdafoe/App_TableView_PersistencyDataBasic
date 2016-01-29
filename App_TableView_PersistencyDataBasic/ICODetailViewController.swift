//
//  ICODetailViewController.swift
//  App_TableView_PersistencyDataBasic
//
//  Created by User on 13/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

class ICODetailViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var dataTask : String = ""
    var dataDescription : String = ""
    var dataPriority : String = ""
    var dataImage : UIImage?
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myTaskLBL: UILabel!
    @IBOutlet weak var myDescriptionTV: UITextView!
    @IBOutlet weak var myPriorityLBL: UILabel!
    @IBOutlet weak var myImageRepresentation: UIImageView!

    
    //MARK: - LIFE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTaskLBL.text = dataTask
        myDescriptionTV.text = dataDescription
        myPriorityLBL.text = dataPriority
        myImageRepresentation.image = dataImage!

        self.title = dataTask

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
