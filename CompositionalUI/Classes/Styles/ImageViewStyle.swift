//
//  ImageViewStyle.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import Foundation

public protocol ImageViewStyle {
    var rawValue: Int { get }
    var stylers: [Int: ImageViewStyler] { get }
    var styler: ImageViewStyler { get }
}

extension ImageViewStyle {
    public var styler: ImageViewStyler {
        guard let styler = stylers[self.rawValue] else {
            fatalError("Styler accessor for \(String(describing: type(of: self))) did not find a match within the stylers dictionary")
        }
        
        return styler
    }
}
