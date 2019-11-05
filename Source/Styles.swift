//
//  Styles.swift
//  LayoutRefactor
//
//  Created by Carlos Triana on 11/4/19.
//  Copyright © 2019 Carlos Triana. All rights reserved.
//

import Foundation
import UIKit

typealias Style = (_ view: UIView) -> Void

class S {
    
    static var roundedCorners: Style = {(view) -> Void in
        view.layer.cornerRadius = 12
    }
    
    static var header: Style = {(view) -> Void in
        guard let label = view as? UILabel else { return }
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
    }
}

extension UIView {
    func styles(_ styles: [Style]) {
        for style in styles {
            style(self)
        }
    }
}
