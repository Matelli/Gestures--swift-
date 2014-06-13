//
//  ViewController.swift
//  Gestures
//
//  Created by Jonathan Schmidt on 04/06/2014.
//  Copyright (c) 2014 Matelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageView = UIImageView(image: UIImage(named: "TSFH-TG.jpg"))
        imageView.frame.size.width = self.view.bounds.size.width / 3
        imageView.frame.size.height = self.view.bounds.size.height / 3
        imageView.center = self.view.center
        imageView.contentMode = .ScaleAspectFit
        
        imageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action:"handlePan:"))
        imageView.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: "handleRotation:"))
        imageView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: "handleScale:"))
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "reset:"))
        imageView.userInteractionEnabled = true
        
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handlePan(sender:UIPanGestureRecognizer) {
        sender.view.center.x += sender.translationInView(self.view).x
        sender.view.center.y += sender.translationInView(self.view).y
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    func handleRotation(sender:UIRotationGestureRecognizer) {
        sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation)
        sender.rotation = 0
    }
    
    func handleScale(sender:UIPinchGestureRecognizer)
    {
        sender.view.transform = CGAffineTransformScale(sender.view.transform, sender.scale, sender.scale)
        sender.scale = 1
    }
    
    func reset(sender:UITapGestureRecognizer) {
        UIView.animateWithDuration(2, animations:{
            sender.view.transform = CGAffineTransformIdentity
            sender.view.center = self.view.center
            })
        
    }

}

