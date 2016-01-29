//
//  ICOTareasViewController.swift
//  App_TableView_PersistencyDataBasic
//
//  Created by User on 12/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

class ICOTareasViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var nombreCategoria = "Sin Categoria"
    var pickerData = ["ALTA","MEDIA - ALTA","MEDIA","MEDIA - BAJA", "BAJA", "BAJA - BAJA"]
    
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myAddTaskTF: UITextField!
    @IBOutlet weak var myAddDescriptionTV: UITextView!
    @IBOutlet weak var myAddPriorityTF: UITextField!
    @IBOutlet weak var myNewCategoryLBL: UILabel!
    
    //IMAGEN
    @IBOutlet weak var myImageViewIV: UIImageView!

    
    //MARK: - IBACTION
    @IBAction func saveInfoInTableView(sender: AnyObject) {
        
        
        
        if myAddTaskTF.text == "" || myAddDescriptionTV.text == "" || myAddPriorityTF.text == "" || myImageViewIV.image == nil{
            
            displayAlertViewController("Hey", message: "completa toda la informacion requerida")
            
        }else{
        
        
            //IMAGEN
            let imageDataComplete : NSData = UIImageJPEGRepresentation(myImageViewIV.image!, 1)!

            myListTask.append(myAddTaskTF.text!)
            myListDescription.append(myAddDescriptionTV.text!)
            myListPriority.append(myAddPriorityTF.text!)
            myListCategory.append(myNewCategoryLBL.text!)

        
            //IMAGEN
            myListPhoto.append(imageDataComplete)
            
            NSUserDefaults.standardUserDefaults().setObject(myListTask, forKey: "miListaDeTareas")
            NSUserDefaults.standardUserDefaults().setObject(myListDescription, forKey: "miDescripcionDeTarea")
            NSUserDefaults.standardUserDefaults().setObject(myListPriority, forKey: "miPrioridadDeLista")
            NSUserDefaults.standardUserDefaults().setObject(myListCategory, forKey: "miNuevaCategoria")
            
            //IMAGEN
            NSUserDefaults.standardUserDefaults().setObject(myListPhoto, forKey: "miPhoto")
            
            
            let localNotification = UILocalNotification()
            localNotification.fireDate = NSDate(timeIntervalSinceNow: 3600)
            localNotification.alertBody = "Hey tienes una nueva tarea"
            localNotification.timeZone = NSTimeZone.defaultTimeZone()
            localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
            
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
            
            
            
            myAddTaskTF.text = ""
            myAddDescriptionTV.text = ""
            //myAddPriorityTF.text = ""
            
            myNewCategoryLBL.text = "Sin Categoria"
        
            //IMAGEN
            myImageViewIV.image = UIImage(named: "backgroundPhoto@2x.png")
            
            
        }

    }
    
    
    @IBAction func showMenuCamera(sender: AnyObject) {
        
        PickPhoto()
        
    }
    

    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        myAddPriorityTF.inputView = pickerView
        myAddPriorityTF.text = pickerData[0]

        myNewCategoryLBL.text = nombreCategoria
        
        //IMAGEN
        myImageViewIV.layer.cornerRadius = myImageViewIV.frame.size.width/2
        myImageViewIV.clipsToBounds = true
        
        //print("\(NSUserDefaults.standardUserDefaults().objectForKey("miPhoto"))")
        
        
        

    }
    
    //MARK: - UTILS / AUXILIARES
    func displayAlertViewController(title: String, message: String){
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let actionVC = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertVC.addAction(actionVC)
        presentViewController(alertVC, animated: true, completion: nil)
        
    }
    
    

    
    //MARK: - PICKERVIEW DELEGATE
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 30
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        myAddPriorityTF.text = pickerData[row]
        //self.view.endEditing(true)
    
    }
    
    /*func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName: UIFont(name: "Georgia", size: 26.0)!, NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel.attributedText = myTitle
        
        //Color y centrado de la etiqueta
        // esto es el MATIZ(HUE) que lo calculamos en el numero actual de elemetos sobre el numero de objetos del array
        //realizamos un Castig de Int a CGFloat (CoreGraphics)
        
        let hue = CGFloat(row) / CGFloat(pickerData.count)
        pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 0.3, brightness: 1.0, alpha: 1.0)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
        
    }*/
    
    
    
    //MARK: - BAJA AUTOMATICAMENTE EL TECLADO
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    //MARK: - SEGUE NORMAL
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "SeleccionaUnaCategoria"{
        
            let controller = segue.destinationViewController as! ICOCategoryTableViewController
            
                controller.nombreCategoriaSeleccionada = nombreCategoria
            
        }
    }
    
    //MARK: - SEGUE ESPECIAL
    //Este es el segue especial que nos desapila los controladores
    @IBAction func icoCategoryVCDidSelectCategory(segue: UIStoryboardSegue){
        
        let controller = segue.sourceViewController as! ICOCategoryTableViewController
        
        nombreCategoria = controller.nombreCategoriaSeleccionada
        
        myNewCategoryLBL.text = nombreCategoria   
        
    }
    


}


//MARK: - PICKER PHOTO
extension ICOTareasViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func PickPhoto(){
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            
            showPhotoMenu()
            
        }else{
            
            choosePhotoFromLIbrary()
        }
    }
    
    
    func showPhotoMenu(){
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)

        let cancelAccion = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .Default, handler: {
            
            Void in self.takePhotoWithCamera()
        })
        
        let chooseFromLibraryAction = UIAlertAction(title: "Choose from Library", style: .Default, handler: {
            
            Void in self.choosePhotoFromLIbrary()
        })
        
        alertController.addAction(cancelAccion)
        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromLibraryAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func takePhotoWithCamera(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    func choosePhotoFromLIbrary(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {

        
        myImageViewIV.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
}

