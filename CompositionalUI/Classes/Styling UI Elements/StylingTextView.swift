//
//  StylableTextView.swift
//  CompositionalUI
//
//  Created by Jaxon Evans on 12/28/17.
//

import UIKit

@IBDesignable
open class StylingTextView: UITextView {
    
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
    
    var styles: [TextViewStyle] {
        fatalError("\(String(describing: type(of: self))) inherits from StylingTextView but does not override 'styles'")
    }
}

extension StylingTextView: Stylable {
    func configureStyle() {
        for style in styles {
            style.styler(self)
        }
    }
}

