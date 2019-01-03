//
//  StylableButton.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import UIKit

@IBDesignable
open class StylingButton: UIButton {
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureStyle()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        configureStyle()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        configureStyle()
    }
    
    open var styles: [ButtonStyle] {
        fatalError("\(String(describing: type(of: self))) inherits from StylingButton but does not override 'styles'")
    }
    
    public func configureStyle() {
        for style in styles {
            style.styler(self)
        }
    }
}

