//
//  ViewController.swift
//  AutoIQ
//
//  Created by Harumi on 7/14/20.
//  Copyright © 2020 Harumi Hokari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let iconImage = UIImageView(image: UIImage(named: "Icon")!)
    let splashView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splashView.backgroundColor = UIColor(red: 255/255, green: 53/255, blue: 79/255, alpha: 1.0)
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        iconImage.contentMode = .scaleAspectFit
        splashView.addSubview(iconImage)
        iconImage.frame = CGRect(x: splashView.frame.midX - 50, y: splashView.frame.midY - 50, width: 100, height: 100)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.scaleDownAnimation()
        }
    }

    func scaleDownAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.iconImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { ( success ) in
            self.scaleUpAnimation()
        }
    }

    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.iconImage.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { ( success ) in
            self.removeSplashScreen()
        }
    }
    
    func removeSplashScreen() {
        splashView.removeFromSuperview()
    }
    
}

