//
//  DrawerAnalyticViewController.swift
//  Analytics
//
//  Created by BigData on 27/04/18.
//  Copyright © 2018 BigData. All rights reserved.
//

import UIKit
import MMDrawerController

class DrawerAnalyticViewController: MMDrawerController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let menuViewController = storyBoard.instantiateViewController(withIdentifier: "menuID")
        let rootViewController = storyBoard.instantiateViewController(withIdentifier: "rootID") as! UINavigationController

        self.leftDrawerViewController = menuViewController;
        self.centerViewController = rootViewController;
        
        self.setGestureShouldRecognizeTouch({(drawerController: MMDrawerController?, gesture: UIGestureRecognizer?, touch: UITouch?) -> Bool in
            var shouldRecognizeTouch = false;
            
            if(drawerController?.openSide == MMDrawerSide.none && gesture is UIPanGestureRecognizer) {
                let view = drawerController?.centerViewController.view
                let location: CGPoint? = touch?.location(in: view);
                shouldRecognizeTouch = (view?.bounds.contains(location!))!
            }
            
            return shouldRecognizeTouch;
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
