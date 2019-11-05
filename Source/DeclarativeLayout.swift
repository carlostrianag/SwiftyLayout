//
//  DeclarativeLayout.swift
//  LayoutRefactor
//
//  Created by Carlos Triana on 11/4/19.
//  Copyright © 2019 Carlos Triana. All rights reserved.
//

import Foundation
import UIKit

class DeclarativeLayout {
    var initialView: UIView? = nil
    var relatedView: UIView? = nil
    
    @discardableResult
    func top(_ constant: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.topOf(relatedView, constant: constant)
        }
        return self
    }
    
    @discardableResult
    func left(_ constant: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.leftOf(relatedView, constant: constant)
        }
        return self
    }
    
    func right(_ constant: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.rightOf(relatedView, constant: constant)
        }
        return self
    }
    
    @discardableResult
    func bottom(_ constant: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.bottomOf(relatedView, constant: constant)
        }
        return self
    }
    
    @discardableResult
    func edges(_ padding: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView {
            view.toEdgesOfContainer(padding: padding)
        }
        return self
    }
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> DeclarativeLayout {
        if let view = initialView {
            view.setSize(width: width, height: height)
        }
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> DeclarativeLayout {
        if let view = initialView {
            view.setWidth(width)
        }
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> DeclarativeLayout {
        if let view = initialView {
            view.setHeight(height)
        }
        return self
    }
    
    @discardableResult
    func centered() -> DeclarativeLayout {
        if let view = initialView {
            view.centeredInContainer()
        }
        return self
    }
    
    @discardableResult
    func centeredVertically(offset by: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.centerYOf(relatedView, constant: by)
        }
        return self
    }
    
    @discardableResult
    func centeredHorizontally(offset by: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.centerXOf(relatedView, constant: by)
        }
        return self
    }
    
    @discardableResult
    func below(offset by: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.belowOf(relatedView, constant: by)
        }
        return self
    }
    
    
    @discardableResult
    func before(offset by: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.before(relatedView, constant: by)
        }
        return self
    }
    
    @discardableResult
    func after(offset by: CGFloat = 0) -> DeclarativeLayout {
        if let view = initialView, let relatedView = relatedView {
            view.after(relatedView, constant: by)
        }
        return self
    }
    
}


extension UIView {
    func layout(using view: UIView? = nil) -> DeclarativeLayout {
        let layout = DeclarativeLayout()
        layout.relatedView = view ?? superview
        layout.initialView = self
        return layout
    }
    
}
