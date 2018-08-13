//
//  ReadabilityViewController.swift
//  CaptureCard
//
//  Created by Fekri on 12/11/16.
//  Copyright © 2016 MF. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    //================
    // MARK: - Variables
    //================
    
    /// variable to store image clicked from Dashboard
    var image: UIImage?

    //=============
    // MARK: Outlets
    //=============
    
    /// image view to display captured image
    @IBOutlet weak var caprturesImageView: UIImageView!

    //=================
    // MARK: - Overrides
    //=================
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// this will hide the navigation bar
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //================
    // MARK: - Methods
    //================
    
    /// this function will display captured image into image view
    func initView() {
        caprturesImageView.image = image
    }
}
