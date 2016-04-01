//
//  WeatherCurrent.swift
//  current-weather
//
//  Created by Vyacheslav Horbach on 01/04/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import Foundation

class WeatherCurrent {
    private var _temperature: String!
    private var _txtDesc: String!
    private var _lasUpdated: String!
    
    var lastUpdated: String {
        if _lasUpdated == nil {
            return ""
        }
        
        return _lasUpdated
    }
    
    var txtDesc: String {
        if _txtDesc == nil {
            return ""
        }
        
        return _txtDesc
    }
    
    var temperature: String {
        if _temperature == nil {
            return ""
        }
        
        return _temperature
    }
    
    func downloadCurrentWeather(completed: DonwloadComplete) {
        
    }
}
