//
//  SliderView.swift
//  Slider
//
//  Created by 유영문 on 25/01/2019.
//  Copyright © 2019 유영문. All rights reserved.
//

import UIKit

protocol SliderDelegate: class {
    func settingOnOff(isSetting: Bool, time: Int)
}

class SliderView: UIView {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var timeSlider: UISlider!
    @IBOutlet var okBtn: UIButton!
    
    weak var delegate: SliderDelegate?
    var isSetting: Bool = false
    var time: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    @IBAction func timeSliderControl(_ sender: DesignSlider) {
        let value = Int(sender.value)
        timeSlider.setValue(Float(value), animated: true)
        timeLabel.text = String(value)
    }
    
    @IBAction func timeSliderDone(_ sender: DesignSlider) {
        let value = timeSlider.value
        self.time = Int(value)
    }
    
    @IBAction func closeBtnClick(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    @IBAction func okBtnClick(_ sender: UIButton) {
        delegate?.settingOnOff(isSetting: isSetting, time: time)
        self.removeFromSuperview()
    }
    
    func initSliderView() {
        timeSlider.setValue(Float(time), animated: true)
        timeLabel.text = "\(Int(timeSlider.value))"
    }
}

@IBDesignable
class DesignSlider: UISlider {
    @IBInspectable var trackHeight: CGFloat = 2
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
    }
    
    var thumbRect: CGRect {
        let trackRect = self.trackRect(forBounds: bounds)
        return thumbRect(forBounds: bounds, trackRect: trackRect, value: value)
    }
}

