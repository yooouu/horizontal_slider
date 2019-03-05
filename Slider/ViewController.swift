//
//  ViewController.swift
//  Slider
//
//  Created by 유영문 on 25/01/2019.
//  Copyright © 2019 유영문. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func openSlider(_ sender: UIButton) {
        let sliderView: SliderView = UINib(nibName: "SliderView", bundle: nil).instantiate(withOwner: self, options: nil).first as! SliderView
        sliderView.backgroundColor = UIColor.darkGray
        sliderView.frame = self.view.frame
        sliderView.isSetting = false
        sliderView.initSliderView()
        sliderView.delegate = self
        self.view.addSubview(sliderView)
    }
}

extension ViewController: SliderDelegate {
    func settingOnOff(isSetting: Bool, time: Int) {
        print("isSetting: \(isSetting), time: \(time)")
    }
}

