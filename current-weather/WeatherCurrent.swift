//
//  WeatherCurrent.swift
//  current-weather
//
//  Created by Vyacheslav Horbach on 01/04/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import Foundation
import Alamofire

class WeatherCurrent {
    private var _temperature: String!
    private var _txtDesc: String!
    private var _lastUpdated: String!
    
    var lastUpdated: String {
        if _lastUpdated == nil {
            return ""
        }
        
        return _lastUpdated
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
    /*
    init(temperature: String, desc: String, lastUpdated: String) {
        self._temperature = temperature
        self._txtDesc = desc
        self._lasUpdated = lastUpdated
    } */
    
    func downloadCurrentWeather(completed: DownloadComplete) {
        let url = NSURL(string: API_URL)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let listOfProperties = dict["list"] as? [Dictionary<String, AnyObject>] {
                    if let firstItem = listOfProperties[0] as? Dictionary<String, AnyObject> {
                        
                        //parse current temperature
                        if let temperature = firstItem["main"]?["temp"] as? Double {
                            self._temperature = String(round((temperature - 275.15)*10)/10)
                            
                        }
                        
                        //parse last update
                        if let updated = firstItem["dt_txt"] as? String {
                            self._lastUpdated = updated
                            
                        }
                        
                        //parse description of the weather
                        if let currentDesc = firstItem["weather"]?[0]?["description"] as? String {
                            self._txtDesc = currentDesc
                            
                        }
                    }
                }
            }
            completed()
        }
    }
}
