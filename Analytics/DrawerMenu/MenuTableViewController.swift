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
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let menuTitle = cell.contentView.viewWithTag(1) as! UILabel
        
        switch indexPath.row {
            case 0:
                menuTitle.text = "GENERAL OVERVIEW"
            case 1:
                menuTitle.text = "TRANSACTION OVERVIEW"
            default:
                menuTitle.text = "Contoh"
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let drawerController = self.parent as! MMDrawerController;
        let navController = drawerController.centerViewController as! UINavigationController;
        
        
        switch indexPath.row {
            case 0:
                navController.viewControllers.first?.performSegue(withIdentifier: "aboutSegue", sender: nil)
            case 1:
                navController.viewControllers.first?.performSegue(withIdentifier: "settingSegue", sender: nil)
            default:
                assert(false)
        }
        drawerController.toggle(.left, animated: true, completion: nil)
    }

}
