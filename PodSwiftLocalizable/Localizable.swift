//
//  Localizable-Swift.swift
//  CityTaxi
//
//  Created by Andres Silva Gomez on 8/16/16.
//  Copyright © 2016 Andres Silva Gomez. All rights reserved.
//

import UIKit

enum LocalizableFile {
    case SingleFile
    case MultiFile
}

enum LocalizableInterface {
    case KeyValue
    case Classes
    case Boot
}

class Localizable: NSObject {
    
    let storageKey = "localizable.swift.language"
    
    var fileName = "test-lang"
    
    var localizableFileType : LocalizableFile = .SingleFile
    
    var defaultLanguage : Languages = .English
    
    var localizableInterface : LocalizableInterface = .Boot
    
    static let sharedInstance = Localizable()
    
    
    // MARK :  Read Files
    
    private func readJSON(fromLanguage lang:String) -> NSDictionary? {
        let fileName = self.localizableFileType == .SingleFile ? self.fileName : "\(self.fileName)-\(lang)"
        return self.readJSON(fileName)
    }

    private func readJSON() -> NSDictionary? {
        return self.readJSON(fromLanguage: self.language())
    }
    
    private func readDefaultJSON() -> NSDictionary? {
        return self.readJSON(fromLanguage: self.defaultLanguage.rawValue)
    }
    
    private func readJSON(fileName:String) -> NSDictionary? {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        let data = NSData(contentsOfFile: path!)
        do {
            return try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
        }
        catch {
            assert(false)
        }
        return nil
    }
    
    // MARK :
    
    func language() -> String {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let lang = defaults.stringForKey(self.storageKey) {
            return lang
        }
        return NSLocale.preferredLanguages()[0].componentsSeparatedByString("-")[0]
    }
    
    func updateLanguage(language:Languages) -> Void {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(language.rawValue, forKey: self.storageKey)
        defaults.synchronize()
    }
    
    func resetDefaultLanguage() -> Void {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey(self.storageKey)
        defaults.synchronize()
    }
    
    
    // MARK :
    
    private func localizeAny(lang:String, key:String, defaultLang:Bool) -> String? {
        if defaultLang && self.language() == self.defaultLanguage.rawValue {
            return key
        }
        
        let json = defaultLang ? self.readDefaultJSON() : self.readJSON()
        
        if self.localizableFileType == .SingleFile {
            if let string = self.localizeSingleFile(lang, key: key, defaultLang: defaultLang, json: json) {
                return string
            }
        }
        
        if let string = self.localizeMultiFile(lang, key: key, defaultLang: defaultLang, json: json) {
            return string
        }
        
        return key
    }
    
    private func localizeSingleFile(lang:String, key:String, defaultLang:Bool, json:NSDictionary?) -> String? {
        if let segment = json![lang] {
            if let string = segment[key]! {
                return string as? String
            }
            
            if let string = self.localizeWithKeys(key, json: segment) {
                return string
            }
        }
        return defaultLang ? key : nil
    }
    
    private func localizeMultiFile(lang:String, key:String, defaultLang:Bool, json:NSDictionary?) -> String? {
        if let string = json![key] {
            return string as? String
        }
        
        if let string = self.localizeWithKeys(key, json: json!) {
            return string
        }
        
        return defaultLang ? key : nil
    }
    
    private func localizeWithKeys(keys: String, json:AnyObject?) -> String? {
        let values = keys.componentsSeparatedByString(".")
        var jsonCopy = json
        for key in values {
            if let result = jsonCopy?[key] {
                jsonCopy = result
            } else {
                return nil
            }
        }
        return jsonCopy as? String
    }
    
    private func localizeLang(key:String, lang:String) -> String {
        if let string = self.localizeAny(lang, key:key, defaultLang:false) {
            return string
        }
        return self.localizeAny(self.defaultLanguage.rawValue, key:key, defaultLang:true)!
    }
    
    // MARK :
    
    func localize(key:String) -> String {
        return self.localizeLang(key, lang: self.language())
    }
    
    func localize(key:String, replace:String) -> String {
        var string = self.localize(key)
        string = string.stringByReplacingOccurrencesOfString("%", withString: replace)
        return string
    }
    
    func localize(key:String, withArray replace:[String]) -> String {
        var string = self.localize(key)
        var array = string.componentsSeparatedByString("%")
        string = ""
        for (index, element) in replace.enumerate() {
            string = index == 0 ? "\(array[index])\(element)" : "\(string)\(array[index])\(element) "
        }
        return string
    }
    
    func localize(key:String, withKeyValues replace:[String:String]) -> String {
        var string = self.localize(key)
        for (key, value) in replace {
            string = string.stringByReplacingOccurrencesOfString(":\(key)", withString: value)
        }
        return string
    }
    
    //MARK : Update languague
    
    //Multi File
    func saveLanguage(dictionary: NSDictionary,language: String) {
        if NSJSONSerialization.isValidJSONObject(dictionary) {
            do {
                let path = self.fileName + "-" + language
                let rawData = try NSJSONSerialization.dataWithJSONObject(dictionary, options: .PrettyPrinted)
                let pathJson = NSBundle.mainBundle().pathForResource(path, ofType: "json")
                let json = NSString(data: rawData, encoding: NSUTF8StringEncoding)
                _ = try json?.writeToFile(pathJson!, atomically: true, encoding: NSUTF8StringEncoding)
            } catch let error as NSError{
                print(error)
            }
        }
    }
    //Single File
    func saveLanguage(dictionary: NSDictionary) {
        if NSJSONSerialization.isValidJSONObject(dictionary) {
            do {
                let path = self.fileName
                let rawData = try NSJSONSerialization.dataWithJSONObject(dictionary, options: .PrettyPrinted)
                let pathJson = NSBundle.mainBundle().pathForResource(path, ofType: "json")
                let json = NSString(data: rawData, encoding: NSUTF8StringEncoding)
                _ = try json?.writeToFile(pathJson!, atomically: true, encoding: NSUTF8StringEncoding)
            } catch let error as NSError{
                print(error)
            }
        }
    }
    
    
}
