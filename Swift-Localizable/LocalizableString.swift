//
//  Localizable.swift
//  CityTaxi
//
//  Created by Andres Silva Gomez on 8/16/16.
//  Copyright © 2016 Andres Silva Gomez. All rights reserved.
//

import UIKit

extension String {
    
    func localizable() -> String {
        let localize = Localizable.sharedInstance
        return localize.localize(self)
    }
    
    func localizable(value value:String) -> String {
        let localize = Localizable.sharedInstance
        return localize.localize(self, replace: value)
    }
    
    func localizable(values values:[String]) -> String {
        let localize = Localizable.sharedInstance
        return localize.localize(self, withArray: values)
    }
    
    func localizable(keyValues values:[String:String]) -> String {
        let localize = Localizable.sharedInstance
        return localize.localize(self, withKeyValues: values)
    }
    
}
