//
//  LNSlideConfigViewController.swift
//  CeroCaries
//
//  Created by Ricardo Olea on 08/06/20.
//  Copyright © 2020 Ricardo Olea. All rights reserved.
//

import UIKit

protocol SlideConfigDelegate {
    func slideConfigItemSelectedAtIndex(_ index : Int32)
}


class LNSlideConfigViewController: UIViewController {
    
    @IBOutlet weak var btnCloseConfig: UIButton!
    

    /**
     *  Menu button which was tapped to display the menu
     */
    var btnConfig : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideConfigDelegate?
    
    var index : Int32 = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func onCloseConfig(_ button:UIButton!) {
        
        btnConfig.tag = 0
        btnConfig.isEnabled = true
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseConfig){
                index = -1
            }
            delegate?.slideConfigItemSelectedAtIndex(index)
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
    
}
