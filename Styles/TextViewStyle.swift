//
//  TextViewStyle.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import Foundation

public protocol TextViewStyle {
    var rawValue: Int { get }
    var stylers: [Int: TextViewStyler] { get }
    var styler: TextViewStyler { get }
}

extension TextViewStyle {
    public var styler: TextViewStyler {
        guard let styler = stylers[self.rawValue] else {
            fatalError("Styler accessor for \(String(describing: type(of: self))) did not find a match within the stylers dictionary")
        }
        
        return styler
    }
}
