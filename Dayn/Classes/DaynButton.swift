//
//  DaynButton.swift
//  Dayn
//
//  Created by Antique on 28/1/20.
//  Copyright © 2020 Antique. All rights reserved.
//

import Foundation
import UIKit


enum Style: Int {
    case normal = 0
    case destructive = 1
}

final class DaynButton : UIButton {
    var blurView = UIVisualEffectView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createRounded(view: self, cornerRadius: 10)
    }
    
    func setup() {
        createBlurView()
    }
    
    
    func initWithStyle(style: Style) {
        switch style {
            case .normal:
                setTitleColor(.label, for: .normal)
                titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
            break
            
            case .destructive:
                setTitleColor(.systemRed, for: .normal)
                titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout).bold()
            break
        }
    }
    
    
    func createBlurView() {
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurView)
        sendSubviewToBack(blurView)
        
        blurView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    
    func createRounded(view: UIView, cornerRadius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
