//
//  CertificateViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import SafariServices
import UIKit

class CertificateViewCell: UITableViewCell {
    
    //MARK: Properties
    var certificate: String? {
        didSet {
            guard let string = certificate else { return }
            // Defining an attribute for underlining text using an NSAttributedString
            // I also setted the NSUnderlineStyle attribute to single wich represents only one line
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            
            // I created an NSAttributedString using the NSAttributedString initializer.
            // I provided the original text string and the underlineAttribute to apply the underline style to the text.
            let underlineString = NSAttributedString(string: string, attributes: underlineAttribute)
            
            certificateTitle.attributedText = underlineString
        }
    }
    
    var school: String? {
        didSet {
            guard let string = school else { return }
            schoolName.text = string
        }
    }
    
    var dateString: String? {
        didSet {
            guard let string = dateString else { return }
            
            date.text = string
        }
    }
    
    //MARK: Objects
    lazy var cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.frame = .init(x: 0, y: 0, width: 40, height: 40)
        iconImage.image = UIImage(named: "certificate")
        return iconImage
    }()
    
    lazy var certificateTitle: UILabel = {
        let certificateTitle = UILabel()
        certificateTitle.textColor = UIColor(named: "BlackLabels")
        certificateTitle.textAlignment = .left
        return certificateTitle
    }()
    
    lazy var schoolName: UILabel = {
        let schoolName = UILabel()
        schoolName.textColor = UIColor(named: "GrayLabels")
        schoolName.font = UIFont(name: "Nunito-SemiBold", size: 14)
        schoolName.textAlignment = .left
        return schoolName
    }()
    
    lazy var date: UILabel = {
        let date = UILabel()
        date.textColor = UIColor(named: "GrayLabels")
        date.font = UIFont(name: "Nunito-Medium", size: 12)
        date.textAlignment = .left
        return date
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        backgroundColor = UIColor.clear
        
        let leading = layoutMarginsGuide.leadingAnchor
        
        addSubview(cellView)
        cellView.addSubview(iconImage)
        cellView.addSubview(certificateTitle)
        cellView.addSubview(schoolName)
        cellView.addSubview(date)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        certificateTitle.translatesAutoresizingMaskIntoConstraints = false
        schoolName.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            cellView.widthAnchor.constraint(equalTo: widthAnchor),            
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            iconImage.topAnchor.constraint(equalTo: topAnchor),
            iconImage.leadingAnchor.constraint(equalTo: leading),
            
            certificateTitle.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            certificateTitle.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            
            schoolName.topAnchor.constraint(equalTo: certificateTitle.bottomAnchor),
            schoolName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            
            date.topAnchor.constraint(equalTo: schoolName.bottomAnchor),
            date.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60)
            
        
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            certificateTitle.font = UIFont(name: "Nunito-Bold", size: 16)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 35),
                iconImage.heightAnchor.constraint(equalToConstant: 35)
                
            ])
            
        } else {
            
            certificateTitle.font = UIFont(name: "Nunito-Bold", size: 18)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 35),
                iconImage.heightAnchor.constraint(equalToConstant: 35)
                
            ])
            
        }
        
    }

}
