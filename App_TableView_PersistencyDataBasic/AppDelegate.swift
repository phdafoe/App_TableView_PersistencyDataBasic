//
//  AppDelegate.swift
//  App_TableView_PersistencyDataBasic
//
//  Created by User on 12/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.


        //CONFIGURAR ASPECTO DE LA BARRA DE NAVEGACION
        customizeNavigationBar()
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (window?.frame.size.width)!, height: 20))
        view.backgroundColor = UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 1)
        self.window?.rootViewController?.view .addSubview(view)
        
        //NOTIFOCACION LOCAL
        if(UIApplication.instancesRespondToSelector("registerUserNotificationSettings:")){
            
            let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
            
            UIApplication.sharedApplication().registerUserNotificationSettings(settings)
            
        }
        
        return true
    }
    
    //NOTIFICACION LOCAL
    /*func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        application.applicationIconBadgeNumber = 0
    }*/
    
   


    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
       
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    //MARK: - UTILS
    func customizeNavigationBar(){
        
        let shadow = NSShadow()
        
        shadow.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        shadow.shadowOffset = CGSizeMake(0.0, 1.0)
 
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSShadowAttributeName: shadow]
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "top_menu_bg@2x.png"), forBarMetrics: .Default)
    }


}

