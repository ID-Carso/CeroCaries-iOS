//
//  BaseViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 25/05/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, SlideMenuDelegate, SlideConfigDelegate{

    @IBOutlet weak var customNavigationBar: UINavigationItem!
    
    @IBOutlet weak var slideMenuButton: UIBarButtonItem!
    
    @IBOutlet weak var slideConfigButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setActionshowMenu for AllViews
        slideMenuButton.action = #selector(BaseViewController.onSlideMenuButtonPressed(_:))
        //setActionshowConfig for AllViews
        slideConfigButton.action = #selector(BaseViewController.onSlideConfigButtonPressed(_:))
        
    }
    
    //Disable DarkMode
    func disableDarkMode(){
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
    }
    
    // MARK: - Navigation

    func imageNavBar(){
        let image: UIImage = UIImage(named: "logo.png")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        customNavigationBar.titleView = imageView
        
    }
    
    
    //SlideMenu
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        
        sender.isEnabled = false
        //sender.tag = 10
        let menuVC : LNSlideMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "LNSlideMenu") as! LNSlideMenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        menuVC.index = getIndexViewControllerPrensent()
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
            }, completion:nil)
    }
    
   
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
            
            switch(index){
            case 0:
                print("Home\n", terminator: "")
                self.openViewControllerBasedOnIdentifier("HomeViewController")
                break
            case 1:
                print("Institutions\n", terminator: "")
                self.openViewControllerBasedOnIdentifier("LNInstitutionsViewController")
                break
            default:
                print("default\n", terminator: "")
            }
    }
    //
    
    //SlideConfig
    @objc func onSlideConfigButtonPressed(_ sender : UIButton){
        
        sender.isEnabled = false
        //sender.tag = 10
        let configVC : LNSlideConfigViewController = self.storyboard!.instantiateViewController(withIdentifier: "LNSlideConfig") as! LNSlideConfigViewController
        configVC.btnConfig = sender
        configVC.delegate = self
        configVC.index = getIndexViewControllerPrensent()
        self.view.addSubview(configVC.view)
        self.addChild(configVC)
        configVC.view.layoutIfNeeded()
        configVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            configVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            //sender.isEnabled = true
            }, completion:nil)
    }
    
    func slideConfigItemSelectedAtIndex(_ index: Int32) {
        
            switch(index){
            case 0:
                print("Home\n", terminator: "")
                self.openViewControllerBasedOnIdentifier("HomeViewController")
                break
            case 1:
                print("Institutions\n", terminator: "")
                self.openViewControllerBasedOnIdentifier("LNInstitutionsViewController")
                break
            default:
                print("default\n", terminator: "")
            }
    }
    //
    
    func getIndexViewControllerPrensent() -> Int32 {
    
           var index: Int32 = 0
           return index
    }
    
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        destViewController.modalPresentationStyle = .fullScreen
     
        destViewController.modalTransitionStyle = .crossDissolve
        
       // let topViewController : UIViewController = self.navigationController!.topViewController!
        let topViewController : UIViewController = UIApplication.getPresentedViewController()!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            let str: String! = topViewController.restorationIdentifier
            print("Same VC: \(str.description)")
        } else {
            //self.navigationController!.pushViewController(destViewController, animated: true)
            
            self.present(destViewController, animated: false, completion: nil)
        }
    
    }
   
    
}
    
extension UIApplication{
    class func getPresentedViewController() -> UIViewController? {
        var presentViewController = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentViewController?.presentedViewController
        {
            presentViewController = pVC
        }
        return presentViewController
    }
}

///

//Hide keyboard

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
