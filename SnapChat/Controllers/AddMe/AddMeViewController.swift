//
//  AddMeViewController.swift
//  SnapChat
//
//  Created by Qodors on 11/08/18.
//

import UIKit

class AddMeViewController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddedMe(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SnapchatViewController") as! SnapchatViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnDismissAddMe(_ sender: UIButton) {
        self.dismiss(animated: true) {}
    }
}
