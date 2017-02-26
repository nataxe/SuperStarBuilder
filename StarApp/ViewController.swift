//
//  ViewController.swift
//  StarApp
//
//  Created by Rodrigo on 2017-02-26.
//  Copyright © 2017 Virl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var star: StarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        star.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        star.changePoints(to: Int(sender.value))
    }

    @IBAction func slider2changed(_ sender: UISlider) {
        //star.changeLength(to: Double(sender.value))   //50, 5, 300
        
        /*if sender.value == 1 {                        //1, 0, 1
            star.changeColor(to: UIColor.white)
        } else {
            star.changeColor(to: UIColor(hue: CGFloat(sender.value), saturation: 0.8, brightness: 1, alpha: 1))
        }*/
        
        star.changeRotation(to: Double(sender.value))   //0, -360, 360

    }
    @IBAction func slider3changed(_ sender: UISlider) {
        star.changeTjockis(to: Double(sender.value / sender.maximumValue))

    }
    @IBAction func save(_ sender: UIButton) {
        star.saveStar()
    }
}

