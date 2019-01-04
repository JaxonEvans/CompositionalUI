//
//  XIBLoadableView.swift
//  CompositionalUI tvOS
//
//  Created by Jaxon Evans on 12/28/17.
//

import UIKit

@IBDesignable
open class XIBLoadableView: StylingView {

    var view: UIView!
    
    var nibName: String {
        let classType = type(of: self)
        return UIView.nibNameToLoad(classType.description())
    }
    
    override open var styles: [ViewStyle] {
        return []
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }

    func loadViewFromNib() -> UIView {
        let classType = type(of: self)
        let bundle = Bundle(for: classType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
    }

    override func configureStyle() {
        //configureSubviewsStyle(subviews: subviews)
    }
}

extension UIViewController {
    static func nibNameToLoad(_ classTypeName: String) -> String {
        let projectName = Bundle.main.infoDictionary!["CFBundleName"] as! String
        let nibName = classTypeName.replacingOccurrences(of: projectName, with: "")
        return nibName
    }
}

extension UIView {
    open func configureSubviewsStyle(subviews: [UIView]) {
        for subview in subviews {
            
            guard let subview = subview as? XIBLoadableView else {
                continue
            }
            
            subview.configureStyle()
        }
    }
    
    static func nibNameToLoad(_ classTypeName: String) -> String {
        let projectName = Bundle.main.infoDictionary!["CFBundleName"] as! String
        let nibName  = classTypeName.replacingOccurrences(of: "\(projectName).", with: "")
        
        return nibName
    }
}
