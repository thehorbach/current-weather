//
//  ViewController.swift
//  current-weather
//
//  Created by Vyacheslav Horbach on 01/04/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var txtDesc: UILabel!
    @IBOutlet weak var lastUpdated: UILabel!
    
    var londonWeather = WeatherCurrent()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        londonWeather.downloadCurrentWeather { () -> () in
            self.updateUI()
        } 
    }
    
    func updateUI() {
        let sign = "\(self.londonWeather.temperature)°"
        weatherLbl.text = sign
        
        let anotherSign = "Last Checked: \(self.londonWeather.lastUpdated)"
        lastUpdated.text = anotherSign
        
        txtDesc.text = self.londonWeather.txtDesc.capitalizedString
    }
}

