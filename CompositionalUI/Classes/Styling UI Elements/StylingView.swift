//
//  StylableView.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import UIKit

@IBDesignable
open class StylingView: UIView {
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureStyle()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        configureStyle()
    }
    
    open var styles: [ViewStyle] { return []
        fatalError("\(String(describing: type(of: self))) inherits from StylingView but does not override 'styles'")
    }
}

extension StylingView: Stylable {
    @objc func configureStyle() {
        for style in styles {
            style.styler(self)
        }
    }
}

