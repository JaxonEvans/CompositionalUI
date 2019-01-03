//
//  ViewStyle.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import Foundation

import Foundation

public protocol ViewStyle {
    var rawValue: Int { get }
    var stylers: [Int: ViewStyler] { get }
    var styler: ViewStyler { get }
}

extension ViewStyle {
    public var styler: ViewStyler {
        guard let styler = stylers[self.rawValue] else {
            fatalError("Styler accessor for \(String(describing: type(of: self))) did not find a match within the stylers dictionary")
        }
        
        return styler
    }
}
