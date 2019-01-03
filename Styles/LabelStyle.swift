//
//  LabelStyle.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import Foundation

public protocol LabelStyle {
    var rawValue: Int { get }
    var stylers: [Int: LabelStyler] { get }
    var styler: LabelStyler { get }
}

extension LabelStyle {
    public var styler: LabelStyler {
        guard let styler = stylers[self.rawValue] else {
            fatalError("Styler accessor for \(String(describing: type(of: self))) did not find a match within the stylers dictionary")
        }
        
        return styler
    }
}
