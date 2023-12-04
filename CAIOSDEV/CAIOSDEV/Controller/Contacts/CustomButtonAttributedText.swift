//
//  CustomButtonAttributedText.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 06.11.2023.
//

import UIKit
/**
 `CustomButtonAttributedText` is a custom UIButton subclass designed to display text with an associated icon, where the text is underlined. This class provides a convenient way to create buttons with attributed text, including an icon image.
 
 # Parameters:

 Parameters are set through the convenience init method.
 
 - icon: The UIImage to be used as the icon in the button.
 - text: The String to be displayed as underlined text in the button.
 - target: The target object that will handle the button tap.
 - action: The Selector to be invoked when the button is tapped.
 
 # Customization:

 - The button's background color is set to white.
 - The button's height is fixed at 50 points.
 - The button has a rounded corner with a radius equal to one-third of its height.
 
 # Adaptative Layout:

 - The button's appearance adapts to different device sizes. The icon size and label font are adjusted based on the device type (iPhone 5, 6/7/8, or others).
 
 # Fonts:

 - The label uses the "Nunito-Bold" font with different sizes based on the device type.
 
 # Underline Style:

 - The text is displayed with a single underline style using NSAttributedString.
 
 # Constraints:

 - Auto Layout constraints are used to position the icon and label within the button.
 
 # Note:

 - Make sure to handle the button tap action in the target object's method connected through the action parameter.
 
 # Warning:

 - This class assumes that the DeviceType struct (not provided in the code) is correctly implemented to determine the device type.
 */
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
