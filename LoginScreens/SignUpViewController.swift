//
//  SignUpViewController.swift
//  GymApp
//
//  Created by Daniel Jabbour on 2018-05-19.
//  Copyright © 2018 Daniel Jabbour. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    //Outlets for all user inputs
    @IBOutlet var emailRegTextField: UITextField!
    @IBOutlet var passwordRegTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    
    //Signup action button
    @IBAction func createAccountAction(_ sender: Any) {
        
        if emailRegTextField.text == "" {
            //Check if input is valid for email field
            
            //Alert message structure
            let alertController = UIAlertController(title: "Error", message: "Please enter your email", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else if passwordRegTextField.text != passwordConfirmTextField.text {
            //Check if passwords match
            
            let alertController = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            //Get default auth object by calling Auth.auth() and call createUser method to create a user account in Firebase
            Auth.auth().createUser(withEmail: emailRegTextField.text!, password: passwordConfirmTextField.text!) { (user,error) in
                
                //After signup operation, check if user successfully signed up and return to home page, or display error
                if error == nil {
                    print("You have successfully signed up")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}