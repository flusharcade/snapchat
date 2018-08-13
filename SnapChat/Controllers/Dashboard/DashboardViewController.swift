//
//  DashboardViewController.swift
//  SnapChat
//
//  Created by Qodors on 10/08/18.
//

import UIKit
import MobileCoreServices
import AVFoundation

class DashboardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// this will initialize camera view
    @IBOutlet weak var cameraView: UIView! {
        didSet {
            cameraView.layer.mask = maskLayer
        }
    }
    
    //===================
    // MARK: Lazy Loadings
    //===================
    
    /// this defines camera manager
    lazy var cameraManager: CameraManager = {
        let this = CameraManager()
        return this
    }()
    
    /// this defines the mask that is added above the rectangle camera layer
    lazy var maskLayer: CALayer = {
        let this = CALayer()
        this.backgroundColor = UIColor(red: 0/255,green: 0/255,blue: 0/255,alpha: 0.5).cgColor
        this.addSublayer(rectLayer)
        return this
    }()
    
    /// this defines the rectangle area that will capture the image
    lazy var rectLayer: CAShapeLayer = {
        let this = CAShapeLayer()
        this.fillColor = UIColor.black.cgColor
        this.strokeColor = UIColor.white.cgColor
        return this
    }()
    
    //=================
    // MARK: - Overrides
    //=================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            /// this will setup the camera as soon as the screen is loaded
            try cameraManager.captureSetup(in: cameraView, withPosition: .back)
        } catch {
            
            /// Alert will be displayed if any error is there in camera setup
            let alertController = UIAlertController(title: "Error",message: error.localizedDescription,preferredStyle: .alert)
            alertController.addAction(.init(title: "ok", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ///this will hide navigation bar
        self.navigationController?.navigationBar.isHidden = true
        ///this prepares camera to capture picture
        cameraManager.startRunning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ///this prepares camera to close as the screen is dismissed
        cameraManager.stopRunning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ///The gesture recognizer responsible for popping the top view controller off the navigation stack.
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        /// this will change orientation of the camera when view is transitioning
        cameraManager.transitionCamera()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        /// this will Update frame of camera preview
        self.cameraManager.updatePreviewFrame()
        drawOverRectView()
    }
    
    /// this will pass the captured image to the imag view to display
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "CapturedImage",
            let imageViewController = segue.destination as? ImageViewController,
            let image = sender as? UIImage else {
                return
            }
        imageViewController.image = image
    }

    //================
    // MARK: - Methods
    //================
    
    /// this func will capture picture and crop it
    func captureAndCropp() {
        cameraManager.getImage(croppWith: self.rectLayer.frame) { (croppedImage, _) -> Void in
            guard let croppedImage = croppedImage else {
                return
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "CapturedImage",
                                  sender: croppedImage)
            }
        }
    }
    
    /// this func will draw a rect mask over the camera view
    func drawOverRectView() {
        
        let cameraSize = self.cameraView.frame.size
        // to calculate the height of frame based on screen size
        let frameHeight: CGFloat
        // to calculate the width of frame based on screen size
        let frameWidth: CGFloat
        // to calculate position Y of recFrame to be in center of cameraView
        let originY: CGFloat
        // to calculate position X of recFrame to be in center of cameraView
        let originX: CGFloat
        
        let currentDevice: UIDevice = UIDevice.current
        let orientation: UIDeviceOrientation = currentDevice.orientation
        
        // calculatin position and frame of rectFrame based on screen size
        switch orientation {
        case .landscapeRight, .landscapeLeft:
            frameHeight = (cameraSize.height)/1.4
            frameWidth = cameraSize.width/1.5
        default:
            //if it is faceUp or portrait or any other orientation
            frameHeight = (cameraSize.height)/1.5
            frameWidth = cameraSize.width/1.15
        }
        originY = ((cameraSize.height - frameHeight)/2)
        originX = (cameraSize.width - frameWidth)/2
        
        //create a rect shape layer
        rectLayer.frame = CGRect(x: originX,
                                 y: originY,
                                 width: frameWidth,
                                 height: frameHeight)
        
        let bezierPathFrame = CGRect(origin: .zero,
                                     size: rectLayer.frame.size)
        //add beizier to rect shapelayer
        rectLayer.path = UIBezierPath(roundedRect: bezierPathFrame,
                                      cornerRadius: 10)
            .cgPath
        
        //add shapelayer to layer
        maskLayer.frame = cameraView.bounds
    }
    
    //=================
    // MARK: - Selectors
    //=================
    
    /// this func will be called to click picture
    @IBAction func btnClickPicture(_ sender: Any) {
        captureAndCropp()
    }
    
    /// this func will be called when add me button is clicked
    @IBAction func btnAddMe(_ sender: UIButton) {
        let AddMeViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMeViewController") as! AddMeViewController
        let navController = UINavigationController(rootViewController: AddMeViewController)
        self.present(navController , animated: true) {}
    }
    
    /// this func will be called when Snap button is clicked
    @IBAction func btnSnaps(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SnapChatViewController") as! SnapChatViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    /// this func will be called when Stories button is clicked
    @IBAction func btnStories(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SnapChatViewController") as! SnapChatViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

