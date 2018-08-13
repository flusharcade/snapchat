//
//  AddMeViewController.swift
//  SnapChat
//
//  Created by Qodors on 11/08/18.
//

import UIKit

class AddMeViewController: UIViewController {
    
    //=================
    // MARK: - Overrides
    //=================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// this will hide the navigation bar
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //=================
    // MARK: - Selectors
    //=================
    
    /// this func will be called to dismiss the Add Me view 
    @IBAction func btnDismissAddMe(_ sender: UIButton) {
        self.dismiss(animated: true) {}
    }
}
