//
//  File.swift
//  
//
//  Created by Gerlandio Lucena on 25/02/21.
//

import Foundation

@propertyWrapper
public struct QualityAssure<Value: Comparable> {
    public var wrappedValue: Value {
        didSet {
            wrappedValue = min(max(range.lowerBound, wrappedValue), range.upperBound)
        }
    }
    
    public var range: ClosedRange<Value>
}
