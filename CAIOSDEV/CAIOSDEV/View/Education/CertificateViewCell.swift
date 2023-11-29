//
//  CertificateViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 11.10.2023.
//

import SafariServices
import UIKit

/**
 `CertificateViewCell` is a custom `UITableViewCell` designed to display information about a certificate, including its title, associated school, and date.

  ### Properties:
  - `certificate`: A string representing the title of the certificate. Setting this property will automatically underline the text in the `certificateTitle` label.
  - `school`: A string representing the name of the school associated with the certificate. Setting this property will update the `schoolName` label.
  - `dateString`: A string representing the date of the certificate. Setting this property will update the `date` label.

  ### UI Elements:
  - `cellView`: The main container view for the cell.
  - `certificateTitle`: A label displaying the title of the certificate. It automatically underlines the text when the `certificate` property is set.
  - `schoolName`: A label displaying the name of the school associated with the certificate.
  - `date`: A label displaying the date of the certificate.

  ### Initialization:
  - `init(style:reuseIdentifier:)`: Initializes the cell with a style and a reuse identifier. Calls the `configureLayout` method to set up the UI.

  ### Layout Configuration:
  - `configureLayout()`: Configures the layout by adding subviews, setting up constraints, and adjusting fonts based on the device type.

  ### Fonts:
  The font size of the `certificateTitle` label is adjusted based on the device type. It uses the "Nunito-Bold" font with a larger size for iPhone 6 and later, and a slightly smaller size for iPhone 5.

  - Note: Ensure that the "Nunito-Bold", "Nunito-SemiBold", and "Nunito-Medium" fonts are available in your project for the respective labels.

  ### Example Usage:
  ```
  let cell = CertificateViewCell(style: .default, reuseIdentifier: "CertificateCell")
  cell.certificate = "Certificate of Achievement"
  cell.school = "Sample School"
  cell.dateString = "January 1, 2023"
 ```
 */
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
        
        addSubview(cellView)
        cellView.addSubview(certificateTitle)
        cellView.addSubview(schoolName)
        cellView.addSubview(date)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        certificateTitle.translatesAutoresizingMaskIntoConstraints = false
        schoolName.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            cellView.widthAnchor.constraint(equalTo: widthAnchor),            
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            certificateTitle.topAnchor.constraint(equalTo: topAnchor),
            certificateTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            schoolName.topAnchor.constraint(equalTo: certificateTitle.bottomAnchor),
            schoolName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            date.topAnchor.constraint(equalTo: schoolName.bottomAnchor),
            date.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
            
        
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            certificateTitle.font = UIFont(name: "Nunito-Bold", size: 16)
            
        } else {
            
            certificateTitle.font = UIFont(name: "Nunito-Bold", size: 18)
                        
        }
        
    }

}
