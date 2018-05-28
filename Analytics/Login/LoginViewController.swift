//
//  LoginViewController.swift
//  Analytics
//
//  Created by BigData on 5/7/18.
//  Copyright © 2018 BigData. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tfUserName: LoginTextField!
    @IBOutlet weak var tfPassword: LoginTextField!
    
    @IBOutlet weak var ivhome: UIImageView!
    @IBOutlet weak var btnLogin: LoginButton!
    
    @IBOutlet weak var scrview: UIScrollView!
    
    let d = ["devbigdata":"devbigdata", "vasindividu":"vasindividu"]
//    private var currentTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrview.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+100)
//        tfUserName.delegate = self
//        tfUserName.tag = 1
//        tfPassword.delegate = self
//        tfPassword.tag = 2
        
        // Do any additional setup after loading the view.
        
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "kf_bg.png")!)
        
        assignbackground()
    }
    func assignbackground(){
//        let background = UIImage(named: "kf_bg")
        self.view.backgroundColor = UIColor.white
        btnLogin.backgroundColor = UIColor.red
        ivhome.image = UIImage(named: "bgdt.png")
//        var imageView : UIImageView!
//        imageView = UIImageView(frame: view.bounds)
//        imageView.contentMode =  UIViewContentMode.scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = background
//        imageView.center = view.center
//        view.addSubview(imageView)
//        self.view.sendSubview(toBack: imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // User finished typing (hit return): hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        currentTextField = textField
//    }
    
//    @IBAction func Submit(sender: UIButton) {
//        if let currentTextField = currentTextField {
//            currentTextField.resignFirstResponder()
//        }
//        performAction()
//    }
    
//    @IBAction func
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func actionLogin(_ sender: Any) {
        performAction()
    }
    
    @IBAction func tfDidEnd(_ sender: Any) {
        performAction()
    }
    
    @IBAction func textFieldDidEnd(_ sender: Any) {
        performAction()
    }
    
    @IBAction func textFieldDidEndOnExit(textField: UITextField) {
        textField.resignFirstResponder()
    }
    func performAction() {
        let name: String = tfUserName.text!
        let pass: String = tfPassword.text!
        
        
        if (name == ""){
            let alert = UIAlertController(title: "Alert", message: "Username is Empty", preferredStyle: UIAlertControllerStyle.alert)

            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if (pass == ""){
            let alert = UIAlertController(title: "Alert", message: "Password is Empty", preferredStyle: UIAlertControllerStyle.alert)

            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }  else if let val = d[name]
        {
            if val == pass {
                UserDefaults.standard.set(name, forKey: "username");
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil);
            } else {
                let alert = UIAlertController(title: "Alert", message: "Username is not registered", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else{
            
            let alert = UIAlertController(title: "Alert", message: "Username is not registered", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    //    func validateUsername(str: String) -> Bool
//    {
//        do
//        {
//            let regex = try NSRegularExpression(pattern: "^[0-9a-zA-Z\\_]{7,18}$", options: .caseInsensitive)
//            if regex.matches(in: str, options: [], range: NSMakeRange(0, str.characters.count)).count > 0 {return true}
//        }
//        catch {}
//        return false
//    }
}
