//
//  ViewController.swift
//  StarApp
//
//  Created by Rodrigo on 2017-02-26.
//  Copyright © 2017 Virl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var slider5: UISlider!
    
    

    func initSliders(){
        let image: UIImage = UIImage(named: "starIcon")!
        Slider1.setThumbImage(image, for: UIControlState.normal)
        slider2.setThumbImage(image, for: UIControlState.normal)
        slider3.setThumbImage(image, for: UIControlState.normal)
        slider4.setThumbImage(image, for: UIControlState.normal)
        slider5.setThumbImage(image, for: UIControlState.normal)
    }
    
    @IBOutlet weak var star: StarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        star.setup()
        initSliders()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        star.changePoints(to: Int(sender.value))
    }

    @IBAction func slider2changed(_ sender: UISlider) {
        star.changeLength(to: Double(sender.value))   //50, 5, 300

    }
    @IBAction func slider3changed(_ sender: UISlider) {
        star.changeTjockis(to: Double(sender.value / sender.maximumValue)) //5 1 10
    }
    
    @IBAction func slider4changed(_ sender: UISlider) {
        star.changeRotation(to: Double(sender.value))   //0, -360, 360
    }
    
    @IBAction func slider5changed(_ sender: UISlider) {
        /*if sender.value == 1 {                        //1, 0, 1
            star.changeColor(to: UIColor.white)
        } else {
            star.changeColor(to: UIColor(hue: CGFloat(sender.value), saturation: 0.8, brightness: 1, alpha: 1))
        }*/
        if sender.value < 0 {                           //0, -1, 1
            star.changeSqueeze(to: (Double(sender.value + 2) / 2.0))
        } else {
            star.changeSqueeze(to: Double(sender.value + 1))
        }
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        let starImage = star.createImage()
        UIImageWriteToSavedPhotosAlbum(starImage, self, nil, nil)

    }
}

