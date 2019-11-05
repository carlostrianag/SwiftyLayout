//
//  Layout.swift
//  Sm4sh
//
//  Created by Carlos Triana on 10/21/19.
//  Copyright © 2019 Carlos Triana. All rights reserved.
//
import Foundation
import UIKit


extension Array where Element: UIView {
    func embedIn<T>(container type: T.Type) -> T where T: UIView {
        let container = T()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubviews(self)
        return container
    }
    
    
    func embedIn<T>(container ofType: T.Type, addToView view: UIView? = nil) -> T where T: UIStackView {
        let container = T(arrangedSubviews: self)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        view?.addSubview(container)
        return container
    }
}

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    
    private func activate(_ constraints: [NSLayoutConstraint]) {
        NSLayoutConstraint.activate(constraints)
    }
    
    func embedIn<T>(container ofType: T.Type, addToView view: UIView? = nil) -> T where T: UIView {
        let container = T()
        container.isUserInteractionEnabled = true
        container.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        
        view?.addSubview(container)
        return container
    }
    
    func toEdgesOfContainer(padding : CGFloat = 0,priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000), active: Bool? = true, usingSafeArea: Bool = true) {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else {
            print("ERR 1: Applying constraints to this view won't have any effect since it has not been added to a superview. Please review the constraints.")
            return
        }
        
        let padding = abs(padding)
        

        if usingSafeArea {
            activate([
                self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding),
                self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
                self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
                ])
        } else {
            activate([
                self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding),
                self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding),
                self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding),
                self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding)
                ])
        }

    }
    
    
    func centeredInContainer() {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let superview = self.superview else {
            print("ERR 2: Applying constraints to this view won't have any effect since it has not been added to a superview. Please review the constraints.")
            return
        }
        
        activate([
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }
    
    
    @discardableResult func centerYOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
        
    }
    
    @discardableResult func centerXOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func topOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true, usingSafeArea: Bool = true) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        
        if usingSafeArea {
            constraint = self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant)
        } else {
            constraint = self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        }
        constraint.isActive = active
        constraint.priority = priority
        return constraint
        
    }
    
    @discardableResult func leftOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func after(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000), active: Bool? = true) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: view, attribute: .right, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func rightOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func before(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000), active: Bool? = true) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: view, attribute: .left, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func heightOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func widthOf(_ view: UIView, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func setMinHeight(_ constant: CGFloat, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func setMaxHeight(_ constant: CGFloat, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        let constraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    
    @discardableResult func setMinWidth(_ constant: CGFloat, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func setMaxWidth(_ constant: CGFloat, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func setMaxWidthOf(_ constant: CGFloat, item: UIView, multiplier: CGFloat? = 1, priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000), active: Bool? = true) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .lessThanOrEqual, toItem: item, attribute: .width, multiplier: multiplier!, constant: constant)
        constraint.isActive = active!
        constraint.priority = priority!
        return constraint
    }
    
    @discardableResult func setHeight(_ constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func setSize(width: CGFloat, height: CGFloat) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        return (setWidth(width), setHeight(height))
    }
    
    @discardableResult func setWidth(_ constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func bottomOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant)
        constraint.isActive = active
        constraint.priority = priority
        return constraint
    }
    
    @discardableResult func belowOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000), active: Bool? = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: multiplier, constant: constant)
        constraint.isActive = active!
        constraint.priority = priority!
        return constraint
        
    }
    
    @discardableResult func aboveOf(_ view: UIView, constant : CGFloat = 0, multiplier : CGFloat = 1, priority: UILayoutPriority? = UILayoutPriority(rawValue: 1000), active: Bool? = true) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint =  NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        return constraint
    }
    

    func toAttributesOf(_ view: UIView, attributes : [NSLayoutConstraint.Attribute : CGFloat], priority: UILayoutPriority = UILayoutPriority(rawValue: 1000), active: Bool = true) {
        self.translatesAutoresizingMaskIntoConstraints = false
        for (attribute, value) in attributes {
            let value = correctConstant(attribute, constant: value)
            switch attribute {
            case .left, .leading:
                self.leftOf(view, constant: value, multiplier: 1, priority: priority, active: active)
                break
            case .right, .trailing:
                self.rightOf(view, constant: value, multiplier: 1, priority: priority, active: active)
                break
            case .bottom:
                self.bottomOf(view, constant: value, multiplier: 1, priority: priority, active: active)
                break
            case .centerX:
                self.centerXOf(view, constant: value)
                break
            case .centerY:
                self.centerXOf(view, constant: value)
                break
            default:
                break
            }
        }
    }
    
    
    
    fileprivate func correctConstant(_ attribute : NSLayoutConstraint.Attribute, constant: CGFloat) -> CGFloat {
        switch attribute {
        case .right, .bottom:
            if constant > 0 {
                return (constant * -1)
            }
            break
        case .left, .top:
            if constant < 0 {
                return (constant * -1)
            }
            break
        default:
            return constant
        }
        return constant
    }
}
