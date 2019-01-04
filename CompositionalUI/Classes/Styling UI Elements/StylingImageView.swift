//
//  StylableImageView.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import UIKit

@IBDesignable
open class StylingImageView: UIImageView {
    
    override open func draw(_ rect: CGRect) {
        configureStyle()
        super.draw(rect)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        configureStyle()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureStyle()
    }
    
    var styles: [ImageViewStyle] {
        fatalError("\(String(describing: type(of: self))) inherits from StylingLabel but does not override 'styles'")
    }
    
    func configureStyle() {
        for style in styles {
            style.styler(self)
        }
    }
}

