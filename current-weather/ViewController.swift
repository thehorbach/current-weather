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
            // do work after completion
        } 
    }
}

