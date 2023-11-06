//
//  CustomButtonAttributedText.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 06.11.2023.
//

import UIKit

class CustomButtonAttributedText: UIButton {
    
    convenience init(icon: UIImage, text: String, target: Any?, action: Selector) {
        self.init()
        
        backgroundColor = .white
        
        frame.size.height = 50
        
        layer.cornerRadius = frame.size.height / 3
        
        let icon = (UIImageView(image: icon))
        
        let underlineAttributed = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let stringAttributed = NSAttributedString(string: text, attributes: underlineAttributed)
        
        let label = UILabel()
        label.attributedText = stringAttributed
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = UIFont(name: "Nunito-Bold", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .left
        
        addSubview(icon)
        addSubview(label)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10)
        
        ])

    }
    
    
}
