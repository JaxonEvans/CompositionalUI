//
//  StylableLabel.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import UIKit

@IBDesignable
open class StylingLabel: UILabel {
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureStyle()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        configureStyle()
    }
    
    override open func draw(_ rect: CGRect) {
        configureStyle()
        super.draw(rect)
    }
    
    open var styles: [LabelStyle] {
        fatalError("\(String(describing: type(of: self))) inherits from StylingLabel but does not override 'styles'")
    }
}

extension StylingLabel: Stylable {
    func configureStyle() {
        for style in styles {
            style.styler(self)
        }
    }
}
