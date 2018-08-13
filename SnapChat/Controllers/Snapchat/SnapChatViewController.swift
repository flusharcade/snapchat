//
//  SnapchatViewController.swift
//  SnapChat
//
//  Created by Qodors on 11/08/18.
//

import UIKit

class SnapChatViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //=================
    // MARK: - Overrides
    //=================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarAttributes()
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
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 20.0/255.0, green: 150.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    }
    
    /// this func will return the number of records to be displayed in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    /// this func will display content of each row of collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : SnapChatCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "SnapChatCell", for: indexPath) as! SnapChatCell
        return cell
    }
}
