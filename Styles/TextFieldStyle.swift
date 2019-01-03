//
//  TextFieldStyle.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import Foundation

public protocol TextFieldStyle {
    var rawValue: Int { get }
    var stylers: [Int: TextFieldStyler] { get }
    var styler: TextFieldStyler { get }
}

extension TextFieldStyle {
    public var styler: TextFieldStyler {
        guard let styler = stylers[self.rawValue] else {
            fatalError("Styler accessor for \(String(describing: type(of: self))) did not find a match within the stylers dictionary")
        }
        
        return styler
    }
}

