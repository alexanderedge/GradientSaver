//
//  AppDelegate.swift
//
//  Copyright (c) 2015 Alexander Edge
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Cocoa
import ScreenSaver

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let gradientView: ScreenSaverView = {
        let view = GradientView(frame: CGRectZero, isPreview: false)
        view.autoresizingMask = .ViewWidthSizable | .ViewHeightSizable
        return view
    }()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        gradientView.frame = window.contentView.bounds
        window.contentView.addSubview(gradientView)
        
        NSTimer.scheduledTimerWithTimeInterval(gradientView.animationTimeInterval(), target: gradientView, selector: "animateOneFrame", userInfo: nil, repeats: true)
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    // MARK: - Actions
    
    @IBAction func showConfiguration(sender: NSObject!) {
        window.beginSheet(gradientView.configureSheet(), completionHandler: nil)
    }
    
    // MARK: - Private

    func windowWillClose(notification: NSNotification!) {
        // Quit the app if the main window is closed
        NSApplication.sharedApplication().terminate(window)
    }
    
}
