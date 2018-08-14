//
//  ChatViewController.swift
//  SnapChat
//
//  Created by Qodors on 14/08/18.
//

import UIKit

class ChatViewController: UIViewController {

    //=================
    // MARK: - Outlets
    //=================
    
    /// var to set background view od send message button
    @IBOutlet weak var viewBGSendMsg: UIView!
    
    //=================
    // MARK: - Overrides
    //=================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarAttributes()
        self.setBorderRadius()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //=================
    // MARK: - METHODS
    //=================
    
    /// this func will set the navigation bar attributes like title color and font etc
    func setNavigationBarAttributes()
    {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    /// this func will give border radius to view
    func setBorderRadius()
    {
        self.viewBGSendMsg.layer.cornerRadius = self.viewBGSendMsg.frame.width/5.0
        self.viewBGSendMsg.clipsToBounds = true
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
