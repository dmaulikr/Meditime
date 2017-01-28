//
//  MeditimeViewController.swift
//  Meditime
//
//  Created by tughral on 1/25/17.
//  Copyright © 2017 turonabdul. All rights reserved.
//

import UIKit

enum TimeUnit: String {
    case minutes = "minutes"
    case seconds = "seconds"
}

struct PickerViewData {
    static let sixtyArray: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59]
}

class MeditimeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var timerPickerView: UIPickerView = TimerPickerView()
    let startButton = UIButton()
    var intervalLabel = UILabel()
    var intervalLabelMin = UILabel()
    let intervalNumberPickerView = IntervalNumberPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        setupStartButton()
        setupTimerPickerView()
        setupIntervalLabel()
        setupIntervalNumberPickerView()
        setupMinutesLabel()
    }
    
        
    // action method for startButton
    func start() {
        print("start()..")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView is IntervalNumberPickerView {
            return 1
        }
        else if pickerView is TimerPickerView {
            return 4
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView is IntervalNumberPickerView {
            return PickerViewData.sixtyArray.count
        }
        else if pickerView is TimerPickerView {
            switch component {
            case 0, 3: return 1
            default: return PickerViewData.sixtyArray.count
            }
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if pickerView is IntervalNumberPickerView {
            return self.view.frame.width * 0.1
        }
        else if pickerView is TimerPickerView {
            switch component {
            case 0,3:
                return self.view.frame.width * 0.3
            default:
                return self.view.frame.width * 0.1
            }
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = view as! UILabel!
        var data = ""
        
        if label == nil {
            label = UILabel()
        }
        
        if pickerView is IntervalNumberPickerView {
            data = String(PickerViewData.sixtyArray[row])
            let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textColor = .black
            label?.textAlignment = .center
            return label!
        }
        else if pickerView is TimerPickerView {
            switch component {
                
            case 0: data = TimeUnit.minutes.rawValue
            label?.textAlignment = .left
                
            case 3: data = TimeUnit.seconds.rawValue
            label?.textAlignment = .right
                
            default: data = String(PickerViewData.sixtyArray[row])
            if component == 1{
                label?.textAlignment = .left
            }
            else {
                label?.textAlignment = .right
                }
            }
            
            let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            
            return label!
        } else {
            return label!
        }
    }
}