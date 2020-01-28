//
//  DaynView.swift
//  Dayn
//
//  Created by Antique on 28/1/20.
//  Copyright © 2020 Antique. All rights reserved.
//

import Foundation
import UIKit


class PVImageView : UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        updateMaskLayer()
    }

    func updateMaskLayer() {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.height/2).cgPath
        self.layer.mask = maskLayer
    }
}


extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}


final class DaynView : UIView {
    var appImageView = PVImageView()
    var userImageView = PVImageView()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .left
        label.textColor = .label
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.text = "JannikCrack"
        
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.numberOfLines = 4
        label.lineBreakMode = .byWordWrapping
        label.text = "Looks like a beautiful notification banner concept"
        
        return label
    }()
    
    var remind = DaynButton()
    var delete = DaynButton()
    var reply = DaynButton()
    
    
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
        //createRounded(view: appImageView, cornerRadius: 20)
    }
    
    
    func setup() {
        createBlurView()
        createView()
    }
    
    
    func createView() {
        appImageView = PVImageView(frame: .zero)
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        appImageView.backgroundColor = .systemGray5
        addSubview(appImageView)
        
        appImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        appImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        appImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        appImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        userImageView = PVImageView(frame: .zero)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.backgroundColor = .systemGray5
        addSubview(userImageView)
        
        userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        userImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: appImageView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: appImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: userImageView.leadingAnchor, constant: -16).isActive = true
        
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subtitleLabel)
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: appImageView.trailingAnchor, constant: 16).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: userImageView.leadingAnchor, constant: -16).isActive = true
        
        
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        
        remind.setTitle("   Remind   ", for: .normal)
        remind.initWithStyle(style: Style(rawValue: 0)!)
        stackView.addArrangedSubview(remind)
        
        
        delete.setTitle("   Delete   ", for: .normal)
        delete.initWithStyle(style: Style(rawValue: 1)!)
        stackView.addArrangedSubview(delete)
        
        
        reply.setTitle("   Reply   ", for: .normal)
        reply.initWithStyle(style: Style(rawValue: 0)!)
        stackView.addArrangedSubview(reply)
        
        
        bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
    }
    
    func createBlurView() {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurView)
        
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
