//
//  Defaults.swift
//  Clock
//
//  Created by Sam Soffes on 7/17/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import Cocoa
import ScreenSaver

let BundleIdentifier = "uk.co.alexedge.GradientSaver"
let ChangeIntervalDefaultsKey = "AGEGradientChangeInterval"

class Defaults: NSObject {
    
    // MARK: - Properties
    
    let screenSaverDefaults: ScreenSaverDefaults = ScreenSaverDefaults.defaultsForModuleWithName(BundleIdentifier) as! ScreenSaverDefaults
    
    var changeInterval: Double {
        didSet {
            setDouble(changeInterval, forKey: ChangeIntervalDefaultsKey)
        }
    }
    
    // MARK: - Initializers
    
    override init() {
        changeInterval = screenSaverDefaults.doubleForKey(ChangeIntervalDefaultsKey)
    }
    
    // MARK: - Private
    
    func setDouble(double: Double, forKey key: String) {
        screenSaverDefaults.setDouble(double, forKey: key)
        save()
    }
    
    func save() {
        screenSaverDefaults.synchronize()
        NSNotificationCenter.defaultCenter().postNotificationName(ConfigurationDidChangeNotificationName, object: nil)
    }
}
