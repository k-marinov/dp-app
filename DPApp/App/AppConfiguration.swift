//
//  AppConfiguration.swift
//  DPApp
//
//  Created by Linxmap on 06/12/2019.
//  Copyright © 2019 Keran Marinov LTD. All rights reserved.
//

import Foundation


class AppConfiguration {

    static func isTestLaunch() -> Bool {
        return ProcessInfo.processInfo.arguments.contains("TEST_MODE_ENABLED")
    }

}

