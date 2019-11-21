//
//  TimerViewController.swift
//  assignment2
//
//  Created by Joey Tang on 2019-11-20.
//  Copyright © 2019 Younhee Lee. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    var hour: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    var time: [Int] = [0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        startBtn.layer.cornerRadius = 5
        startBtn.layer.masksToBounds = true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? ViewController
        {
            vc.time = time
        }
    }
    
    func setLabel() {
        infoLabel.text = "Start timer for "
        infoLabel.text! += String(time[0]) + "h " + String(time[1]) + "m " + String(time[2]) + "s?"
    }
}

extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1, 2:
            return 60
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) Hours"
        case 1:
            return "\(row) Minutes"
        case 2:
            return "\(row) Seconds"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
            time[0] = row
        case 1:
            minutes = row
            time[1] = row
        case 2:
            seconds = row
            time[2] = row
        default:
            break;
        }
        setLabel()
    }
}
