//
//  CertificateViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit

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
        title.text = "Let me show you!"
        title.textColor = UIColor(named: "GrayLabels")
        title.font = UIFont(name: "Nunito-SemiBold", size: 14)
        title.textAlignment = .left
        return title
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
        
        var iconSpace: CGFloat = 100
        var certificateNameSpace: CGFloat = 110
        var schoolNameSpace: CGFloat = 135
        var dateSpace: CGFloat = 150
        
        addSubview(cellView)
        cellView.addSubview(cellTitle)
        cellView.addSubview(subtitle)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellView.widthAnchor.constraint(equalTo: widthAnchor),            
            cellView.heightAnchor.constraint(equalToConstant: 380),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            cellTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            subtitle.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        
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
            
            let iconImage = UIImageView()
            iconImage.frame = .init(x: 0, y: 0, width: 40, height: 40)
            iconImage.image = UIImage(named: "certificate")
            
            let certificateTitle = UILabel()
            certificateTitle.text = MyCertificateModel.cetificateName[i]
            certificateTitle.textColor = UIColor(named: "BlackLabels")
            certificateTitle.font = UIFont(name: "Nunito-Bold", size: 18)
            certificateTitle.textAlignment = .left
            
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
            
        }
        
    }


}
