//
//  CallButton.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 06.11.2023.
//

import UIKit
/**
 CustomButton is a subclass of UIButton that combines an icon and text in a stylized button.

 # Properties

 - icon: An UIImage representing the icon for the button.
 - text: A String representing the text for the button.
 
 # Methods
 
 - convenience init(icon: UIImage, text: String): Initializes a new CustomButton with the specified icon and text.
 
 # Usage:
 ```
 let customButton = CustomButton(icon: UIImage(named: "yourIcon"), text: "Your Button Text")
 view.addSubview(customButton)
```
 
 Note: This class sets a white background with rounded corners, and it allows for adaptive layouts based on the device type.
 */
class CustomButton: UIButton {
    
    convenience init(icon: UIImage, text: String) {
        self.init()
        
        backgroundColor = .white
        
        frame.size.height = 50
        
        layer.cornerRadius = frame.size.height / 3
        
        let icon = (UIImageView(image: icon))
        
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(named: "BlackSecondary")
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
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            label.font = UIFont(name: "Nunito-Bold", size: 10)
            
            NSLayoutConstraint.activate([
            
                icon.widthAnchor.constraint(equalToConstant: 20),
                icon.heightAnchor.constraint(equalToConstant: 20)
            
            ])
            
        } else if DeviceType.isIphone6or7or8 {
            
            label.font = UIFont(name: "Nunito-Bold", size: 12)
            
            NSLayoutConstraint.activate([
            
                icon.widthAnchor.constraint(equalToConstant: 25),
                icon.heightAnchor.constraint(equalToConstant: 25)
            
            ])
            
        } else {
            
            label.font = UIFont(name: "Nunito-Bold", size: 14)
            
        }
        
    }
    
}
