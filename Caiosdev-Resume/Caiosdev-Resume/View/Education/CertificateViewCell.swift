//
//  CertificateViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import SafariServices
import UIKit

protocol certificatePage {
    
    func certificateView(view: UIViewController)
    
}

class CertificateViewCell: UITableViewCell {
    
    //MARK: Objects
    lazy var cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.text = "My certificates"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var subtitle: UILabel = {
        let title = UILabel()
        title.text = ""
        title.textColor = UIColor(named: "GrayLabels")
        title.font = UIFont(name: "Nunito-SemiBold", size: 14)
        title.textAlignment = .left
        return title
    }()
    
    var delegate: certificatePage?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        var iconSpace: CGFloat = 100
        var certificateNameSpace: CGFloat = 102
        var schoolNameSpace: CGFloat = 135
        var dateSpace: CGFloat = 150
        
        addSubview(cellView)
        cellView.addSubview(cellTitle)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            cellView.widthAnchor.constraint(equalTo: widthAnchor),            
            cellView.heightAnchor.constraint(equalToConstant: 380),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            cellTitle.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
        
        ])
        
        for i in 0..<3 {
            
            if i == 1  {
                iconSpace += 100
                certificateNameSpace += 100
                schoolNameSpace += 100
                dateSpace += 100
            } else if i == 2 {
                iconSpace += 100
                certificateNameSpace += 100
                schoolNameSpace += 100
                dateSpace += 100
            }
            
            // Defining an attribute for underlining text using an NSAttributedString
            // I also setted the NSUnderlineStyle attribute to single wich represents only one line
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            
            // I created an NSAttributedString using the NSAttributedString initializer.
            // I provided the original text string and the underlineAttribute to apply the underline style to the text.
            let underlineString = NSAttributedString(string: MyCertificateModel.cetificateName[i], attributes: underlineAttribute)
            
            let iconImage = UIImageView()
            iconImage.frame = .init(x: 0, y: 0, width: 40, height: 40)
            iconImage.image = UIImage(named: "certificate")
            
            let certificateTitle = UIButton()
            certificateTitle.setAttributedTitle(underlineString, for: .normal)
            certificateTitle.titleLabel?.textColor = UIColor(named: "BlackLabels")
            certificateTitle.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 18)
            certificateTitle.titleLabel?.textAlignment = .left
            
            let schoolName = UILabel()
            schoolName.text = "Udemy"
            schoolName.textColor = UIColor(named: "GrayLabels")
            schoolName.font = UIFont(name: "Nunito-SemiBold", size: 14)
            schoolName.textAlignment = .left
            
            let date = UILabel()
            date.text = MyCertificateModel.date[i]
            date.textColor = UIColor(named: "GrayLabels")
            date.font = UIFont(name: "Nunito-Medium", size: 12)
            date.textAlignment = .left
            
            backgroundColor = UIColor.clear
            
            cellView.addSubview(iconImage)
            cellView.addSubview(certificateTitle)
            cellView.addSubview(schoolName)
            cellView.addSubview(date)
            
            iconImage.translatesAutoresizingMaskIntoConstraints = false
            certificateTitle.translatesAutoresizingMaskIntoConstraints = false
            schoolName.translatesAutoresizingMaskIntoConstraints = false
            date.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
            
                iconImage.topAnchor.constraint(equalTo: topAnchor, constant: iconSpace),
                iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                
                certificateTitle.topAnchor.constraint(equalTo: topAnchor, constant: certificateNameSpace),
                certificateTitle.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
                
                schoolName.topAnchor.constraint(equalTo: topAnchor, constant: schoolNameSpace),
                schoolName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                
                date.topAnchor.constraint(equalTo: topAnchor, constant: dateSpace),
                date.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70)
            
            ])
            
            certificateTitle.addTarget(self, action: #selector(certificatePageDidTapped), for: .touchUpInside)
            
        }
        
    }
    
    //Certificate button target
    @objc func certificatePageDidTapped() {
        guard let url = URL(string: MyCertificateModel.iOSDevelopmentURL) else { return }
        
        let vc = SFSafariViewController(url: url )
        vc.modalPresentationStyle = .pageSheet
        
        delegate?.certificateView(view: vc)
        
        
    }


}
