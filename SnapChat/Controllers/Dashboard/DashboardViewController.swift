//
//  DashboardViewController.swift
//  SnapChat
//
//  Created by Qodors on 10/08/18.
//

import UIKit
import MobileCoreServices

class DashboardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayCamera()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self;
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
}
