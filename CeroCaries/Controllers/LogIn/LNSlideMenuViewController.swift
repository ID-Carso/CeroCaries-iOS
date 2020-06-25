//
//  LGSlideMenu.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 01/06/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class LNSlideMenuViewController: UIViewController {
    
    
    @IBOutlet weak var btnCloseMenu: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    var index : Int32 = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    @IBAction func onCloseMenuClick(_ button:UIButton!) {
        
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenu){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    

    @IBAction func actionShared(_ sender: Any) {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.tag = 1
        self.onCloseMenuClick(btn)
    }
    
    @IBAction func actionInstitutions(_ sender: Any) {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.tag = 1
        self.onCloseMenuClick(btn)
    }
    

}

