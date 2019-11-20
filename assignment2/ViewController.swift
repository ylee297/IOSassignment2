//
//  ViewController.swift
//  assignment2
//
//  Created by Younhee Lee on 2019-11-18.
//  Copyright © 2019 Younhee Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
                    // January, 2019
    let history = ["A fire occurs in the Amazon rainforest",
                    // February 6,  2018
                    "The 2018 cryptocurrency crash was the sell-off of most cryptocurrencies",
                    // January 9, 2007
                    "Steve Jobs announced the first iPhone at the Macworld convention",
                    // September 11, 2001
                    "Islamist extremists hijacked four planes that were flying above the US",
                    // August 24, 1995
                    "Window95 is debuts and sold more than one million copies within four days",
                    // 1914
                    "First world war break out",
                    // 1695
                    "rapid colonisation of Americas and India by Europeans",
                    // 2800 years ago
                    "first Olympic games is held",
                    // 26,000 years ago
                    "people around the world use fibers to make baby carriers, clothes, bags, baskets, and nets",
                    // 68 Million years ago
                    "First flowering plants and Chicxulub impact kills off most dinosaurs",
                    // 13.76 billion years ago
                    "Universe begins and first start ignite"]
    
    let percentPerSec:Double = 1/118
    let e = 2.71828
    var currentPercent:Double = 0
    var currentTime:Double = 0;
    var thisYear:Double = 0;
    
    
  
    
    @IBOutlet weak var travelTo: UITextField!
    @IBOutlet weak var progressPercent: UITextField!
    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var progressbar: UIProgressView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressbar.progress = 0.0
        self.travelTo.delegate = self
        /**************** style ******************/
        progressbar.transform = progressbar.transform.scaledBy(x: 1, y: 8)
        progressbar.layer.cornerRadius = 8
        progressbar.clipsToBounds = true
        progressbar.layer.sublayers![1].cornerRadius = 8
        progressbar.subviews[1].clipsToBounds = true
        /**************************************/
        
        // current year setting
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        thisYear = Double(year)
        
        
        currentTime = Double(thisYear) - (pow(e,(20.3444 * pow(0,3) + 3)) - pow(e,3))
 

        
        // default content
        contents.text = history[0]
        timerStart()

        // Do any additional setup after loading the view.
    }
    
    func timerStart(){
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.runEverySecond), userInfo: nil, repeats: true)
    }
    
    @objc func runEverySecond(){
        
        if(currentPercent < 100){
            currentPercent = currentPercent + percentPerSec;
            currentTime = Double(thisYear) - (pow(e,(20.3444 * pow(currentPercent/100,3) + 3)) - pow(e,3))
            progressbar.progress = Float(currentPercent/100)
        }
        
        progressPercent.text = String(round(1000*currentPercent)/1000) + "%"
        if(currentTime < 0 ){
            date.text = String(format: "%.0f years ago", (abs(currentTime)+thisYear))
        } else {
            date.text = String(format: "%.0f", currentTime)
        }
        
        
        //update info
        updateInfo()
//        var date:Double = currentTime.truncatingRemainder(dividingBy: 1)
//        print(date*365)
    }

    func updateInfo(){
        if(currentTime <= 2019 && currentTime > 2018){
            contents.text = history[0]
        } else if (currentTime <= 2018 && currentTime > 2007){
            contents.text = history[1]
        } else if (currentTime <= 2018 && currentTime > 2007){
            contents.text = history[2]
        } else if (currentTime <= 2007 && currentTime > 2001){
            contents.text = history[3]
        } else if (currentTime <= 2001 && currentTime > 1995){
            contents.text = history[4]
        } else if (currentTime <= 1995 && currentTime > 1914){
            contents.text = history[5]
        } else if (currentTime <= 1914 && currentTime > 1695){
            contents.text = history[6]
        } else if (currentTime <= 1695 && currentTime > -800){
            contents.text = history[7]
        } else if (currentTime <= -800 && currentTime > -24000){
            contents.text = history[8]
        } else if (currentTime <= -24000 && currentTime > -13700000000){
            contents.text = history[9]
        } else if (currentTime <= -13700000000){
            contents.text = history[10]
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func travelToWhere(_ sender: Any) {
        currentPercent = Double(travelTo.text ?? "0")!
        currentTime = Double(thisYear) - (pow(e,(20.3444 * pow(currentPercent/100,3) + 3)) - pow(e,3))
        progressbar.progress = Float(currentPercent/100)
        if(currentTime < 0 ){
            date.text = String(format: "%.0f years ago", (abs(currentTime)+thisYear))
        } else {
            date.text = String(format: "%.0f", currentTime)
        }
        
        updateInfo()
    }
    
    
}

