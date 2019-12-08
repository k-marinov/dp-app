//
//  main.swift
//  DPApp
//
//  Created by Linxmap on 06/12/2019.
//  Copyright © 2019 Keran Marinov LTD. All rights reserved.
//

import Foundation
import UIKit


class TestAppDelegate: UIResponder, UIApplicationDelegate {

    var provider: DependencyProvider = {
        print("Loaded from TestAppDelegate")
        return DependencyProvider()
    }()

    /// We want to test the genuine responder chain behaviour of Eurosport.
    /// E.g. ErrorKit sends errors up the responder chain.
    override var next: UIResponder? {
        return AppDelegate()
    }

}


func launchApp() {
    UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        nil,
        NSStringFromClass(AppDelegate.self)
    )
}

if AppConfiguration.isTestLaunch() {
    UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        nil,
        NSStringFromClass(TestAppDelegate.self)
    )
} else {
    launchApp()
}
