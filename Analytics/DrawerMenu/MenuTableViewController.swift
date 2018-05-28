//
//  MenuTableViewController.swift
//  Analytics
//
//  Created by BigData on 27/04/18.
//  Copyright © 2018 BigData. All rights reserved.
//

import UIKit
import MMDrawerController

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView();
        self.tableView.tableHeaderView = UIView();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let name = UserDefaults.standard.string(forKey: "username");
        var result = 0
        if (name == "devbigdata"){
            result = 8
        } else if (name == "vassequis"){
            result = 4
        }
        return result
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let menuTitle = cell.contentView.viewWithTag(1) as! UILabel
        
        let name = UserDefaults.standard.string(forKey: "username");
        if (name == "devbigdata"){
            switch indexPath.row {
            case 0:
                menuTitle.text = "DISTRIBUTOR PERFORMANCE"
            case 1:
                menuTitle.text = "DISTRIBUTOR SALES REALISATION"
            case 2:
                menuTitle.text = "KFTD BRANCH PERFORMANCE"
            case 3:
                menuTitle.text = "KFTD BRANCH SALES REALISATION"
            case 4:
                menuTitle.text = "BRANCH SALES INFORMATION"
            case 5:
                menuTitle.text = "PRODUCT SALES PERFORMANCE"
            case 6:
                menuTitle.text = "PRODUCT SALES INFORMATION"
            case 7:
                menuTitle.text = "LOGOUT"
            default:
                menuTitle.text = "Contoh"
            }
        } else if (name == "vassequis"){
            
            switch indexPath.row {
            case 0:
                menuTitle.text = "HOW TO READ"
            case 1:
                menuTitle.text = "GENERAL OVERVIEW"
            case 2:
                menuTitle.text = "TRANSACTION OVERVIEW"
            case 3:
                menuTitle.text = "LOGOUT"
            default:
                menuTitle.text = "Contoh"
            }
        }
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let drawerController = self.parent as! MMDrawerController;
        let navController = drawerController.centerViewController as! UINavigationController;
        let homeController: HomeController = navController.viewControllers.first as! HomeController;
        
        let name = UserDefaults.standard.string(forKey: "username");
        if (name == "devbigdata"){
        switch indexPath.row {
            case 0:
                homeController.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard7_1.php");
                
//                navController.viewControllers.first?.performSegue(withIdentifier: "aboutSegue", sender: nil)
            case 1:
                homeController.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard1_1.php");
            case 2:
                homeController.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard8_1.php");
            case 3:
                homeController.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard2_1.php");
            case 4:
                homeController.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard3_1.php");
            case 5:
                homeController.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard4_1.php");
            case 6:
                homeController.actionMenu("https://analytics.admedika.co.id/kfmobile/dashboard5_1.php");
            case 7:
                UserDefaults.standard.set(false, forKey: "isLogin");
                UserDefaults.standard.synchronize();
                homeController.checkLogin();
            default:
                assert(false)
            }
        }else if (name == "vassequis"){
            switch indexPath.row {
            case 0:
                homeController.actionMenu("https://analytics.admedika.co.id/vasmobile/dashboard1.php");
            case 1:
                homeController.actionMenu("https://analytics.admedika.co.id/vasmobile/dashboard2.php");
            case 2:
                homeController.actionMenu("https://analytics.admedika.co.id/vasmobile/dashboard3.php");
            case 3:
                UserDefaults.standard.set(false, forKey: "isLogin");
                UserDefaults.standard.synchronize();
                homeController.checkLogin();
            default:
                assert(false)
            }
            
        }
        drawerController.toggle(.left, animated: true, completion: nil)
    }

}
