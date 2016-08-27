//
//  Localizable-UIElements.swift
//  CityTaxi
//
//  Created by Andres Silva Gomez on 8/16/16.
//  Copyright © 2016 Andres Silva Gomez. All rights reserved.
//

import UIKit

class LocalizableBarButtonItem: UIBarButtonItem {
    
    @IBInspectable var localizableKey : String? {
        didSet {
            self.title = self.localizableKey!.localizable()
        }
    }
    
}

class LocalizableButton: UIButton {
    
    @IBInspectable var localizableKey: String? {
        didSet {
            for state in [UIControlState.Normal, .Highlighted, .Selected, .Disabled] {
                self.setTitle(self.localizableKey!.localizable(), forState: state)
            }
        }
    }
    
}

class LocalizableLabel: UILabel {
    
    @IBInspectable var localizableKey : String? {
        didSet {
            self.text = self.localizableKey!.localizable()
        }
    }
    
}

class LocalizableNavigationBarItem: UINavigationItem {
    
    @IBInspectable var localizableKeyTitle: String? {
        didSet {
            self.title = self.localizableKeyTitle!.localizable()
        }
    }
    
    @IBInspectable var localizableKeyPrompt: String? {
        didSet {
            self.prompt = self.localizableKeyPrompt!.localizable()
        }
    }
    
}

class LocalizableSearchBar: UISearchBar {
    
    @IBInspectable var localizableKeyPlaceholder: String? {
        didSet {
            self.placeholder = self.localizableKeyPlaceholder!.localizable()
        }
    }
    
    @IBInspectable var localizableKeyPrompt: String? {
        didSet {
            self.prompt = self.localizableKeyPrompt!.localizable()
        }
    }
    
}

class LocalizableSegmentedControler: UISegmentedControl {
    
    @IBInspectable var localizableKey : String? {
        didSet {
            for index in 0...(self.numberOfSegments-1) {
                let key = self.localizableKey?.componentsSeparatedByString(",")
                self.setTitle(key![index].localizable(), forSegmentAtIndex: index)
            }
        }
    }
    
}

class LocalizableBarItem: UITabBarItem {
    
    @IBInspectable var localizableKey : String? {
        didSet {
            self.title = self.localizableKey!.localizable()
        }
    }
}

class LocalizableTextField: UITextField {
    
    @IBInspectable var localizableKeyText: String? {
        didSet {
            self.text = self.localizableKeyText!.localizable()
        }
    }
    
    @IBInspectable var localizableKeyPlaceholder: String? {
        didSet {
            self.placeholder = self.localizableKeyPlaceholder!.localizable()
        }
    }
    
    
}

class LocalizableTextView: UITextView {
    
    @IBInspectable var localizableKey : String? {
        didSet {
            self.text = self.localizableKey!.localizable()
        }
    }
    
}
