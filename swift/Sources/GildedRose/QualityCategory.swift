//
//  File.swift
//  
//
//  Created by Gerlandio Lucena on 25/02/21.
//

import Foundation

public enum QualityCategory {
    case common
    case legendary
    case aged
    case pass
    case conjured
    
    var quality: Int {
        switch self {
        case .common, .aged, .pass, .conjured:
            return 50
        case .legendary:
            return 80
        }
    }
    
    var qualityVariation: Int {
        switch self {
        case .common, .conjured:
            return -1
        case  .aged, .pass:
            return +1
        case .legendary:
            return 0
        }
    }
}
