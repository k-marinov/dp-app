//
//  DependencyWrapper.swift
//  DPApp
//
//  Created by Linxmap on 06/12/2019.
//  Copyright © 2019 Keran Marinov LTD. All rights reserved.
//


@propertyWrapper
struct Dependency<T> {

    var value: T

    init(_ dependency: () -> T) {
        value = dependency()
    }

    var wrappedValue: T {
        get { value }
    }

}
