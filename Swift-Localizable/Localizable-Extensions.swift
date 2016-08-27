//
//  UILabel.swift
//  CityTaxi
//
//  Created by Andres Silva Gomez on 8/16/16.
//  Copyright © 2016 Andres Silva Gomez. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        if let title = self.title where !title.isEmpty {
            self.title = title.localizable()
        }
    }
    
}

extension UIButton {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        for state in [UIControlState.Normal, .Highlighted, .Selected, .Disabled] {
            if let title = titleForState(state) where !title.isEmpty {
                self.setTitle(title.localizable(), forState: state)
            }
        }
        
    }
    
}

extension UILabel {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        if let text = text where !text.isEmpty {
            self.text = text.localizable()
        }
        
    }
    
}

extension UINavigationItem {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        if let title = self.title where !title.isEmpty {
            self.title = title.localizable()
        }
        
        if let prompt = self.prompt where !prompt.isEmpty {
            self.prompt = prompt.localizable()
        }
    }
    
}

extension UISearchBar {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        if let placeholder = self.placeholder where !placeholder.isEmpty {
            self.placeholder = NSLocalizedString(placeholder, comment: "")
        }
        
        if let prompt = self.prompt where !prompt.isEmpty {
            self.prompt = prompt.localizable()
        }
        
    }
}

extension UISegmentedControl {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        for index in 0...(self.numberOfSegments-1) {
            if let title = self.titleForSegmentAtIndex(index) where !title.isEmpty {
                self.setTitle(title.localizable(), forSegmentAtIndex: index)
            }
        }
        
    }
    
}

extension UITabBarItem {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        if let title = self.title where !title.isEmpty {
            self.title = title.localizable()
        }
    }
}

extension UITextField {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        if let placeholder = placeholder where !placeholder.isEmpty {
            self.placeholder = placeholder.localizable()
        }
        
        if let text = text where !text.isEmpty {
            self.text = text.localizable()
        }
        
    }
}

extension UITextView {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        if Localizable.sharedInstance.localizableInterface == .Classes {
            return
        }
        
        if let text = self.text where !text.isEmpty {
            self.text = text.localizable()
        }
    }
    
}