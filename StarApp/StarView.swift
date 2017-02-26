//
//  StarView.swift
//  StarApp
//
//  Created by Rodrigo on 2017-02-26.
//  Copyright © 2017 Virl. All rights reserved.
//

import UIKit

class StarView: UIView {
    
    var xcenter = 250.0
    var ycenter = 250.0
    var length = 0.0
    var points = 8
    var tjockis = 1.0/3.0
    var rotation = 270.0
    
    var shapeLayer = CAShapeLayer()
    
    
    func makeStarPath(length :Double,points:Int) -> UIBezierPath {
        let path = UIBezierPath()
        var values = [CGPoint?](repeating: nil, count: 2 * points)
        
        for i in stride(from: 0, to: 2*points, by: 2) {
            let xVal = xcenter + length * cos((rotation + Double(i * 180/points)) * M_PI / 180)
            let yVal = ycenter + length * sin((rotation + Double(i * 180/points)) * M_PI / 180)
            values[i] = CGPoint(x: xVal, y: yVal)
            
            let xVal2 = xcenter + length * tjockis * cos((rotation + Double((i + 1) * 180/points)) * M_PI / 180)
            let yVal2 = ycenter + length * tjockis * sin((rotation + Double((i + 1 ) * 180/points)) * M_PI / 180)
            values[i+1] = CGPoint(x: xVal2, y: yVal2)
            
            
        }
        
        path.move(to: values[0]!)
        
        for p in values {
            path.addLine(to: p!)
        }
        path.addLine(to: values[0]!)
        
        path.lineWidth = 4.0
        return path;
    }
    
    func setup() {
        self.backgroundColor = UIColor.clear
        self.isOpaque = false
        xcenter = Double( bounds.width / 2)
        ycenter = Double( bounds.height / 2)
        shapeLayer = CAShapeLayer()
        length = Double(bounds.height * 0.45)
        points = 8
        tjockis = 1.0/3.0
        
        let starPath = makeStarPath(length: length, points: points)
        
        shapeLayer.path = starPath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        
        self.layer.addSublayer(shapeLayer)
        
    }
    
    func changePoints(to : Int){
        points = to
        shapeLayer.path = makeStarPath(length: length, points: points).cgPath
    }
    
    func changeLength(to: Double) {
        length = to
        shapeLayer.path = makeStarPath(length: length, points: points).cgPath

    }
    
    func changeColor(to: UIColor) {
        shapeLayer.fillColor = to.cgColor        
    }
    
    func changeTjockis(to: Double) {
        tjockis = to
        shapeLayer.path = makeStarPath(length: length, points: points).cgPath
        
    }
    
    func changeRotation(to: Double){
        rotation = to / Double(points) - 90.0
        shapeLayer.path = makeStarPath(length: length, points: points).cgPath
    }
    
    
    
    func createImage() -> UIImage{
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageData = UIImagePNGRepresentation(image!)
        let pngImage = UIImage(data: imageData!)
        return pngImage!
        
    }
    
    
}
