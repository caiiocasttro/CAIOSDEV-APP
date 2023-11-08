//
//  EducationViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit

class EducationViewCell: UITableViewCell {
    
    //MARK: Proprieties
    var school: String? {
        didSet {
            guard let string = school else { return }
            schoolName.text = string
        }
    }
    
    var graduatedString: String? {
        didSet {
            guard let string = graduatedString else { return }
            graduateName.text = string
        }
    }
    
    var graduateInfo: String? {
        didSet {
            guard let string = graduateInfo else { return }
            graduateDescription.text = string
        }
    }
    
    lazy var cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: Objects
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "education")
        return iconImage
    }()
    
    lazy var schoolName: UILabel = {
        let school = UILabel()
        school.textColor = UIColor(named: "BlackLabels")
        school.textAlignment = .left
        return school
    }()
    
    lazy var dotImage: UIImageView = {
        let dotImage = UIImageView()
        dotImage.frame = .init(x: 0, y: 0, width: 5, height: 5)
        dotImage.image = UIImage(named: "dot")
        return dotImage
    }()
    
    lazy var graduateName: UILabel = {
        let graduate = UILabel()
        graduate.textColor = UIColor(named: "GrayLabels")
        graduate.textAlignment = .left
        return graduate
    }()
    
    lazy var dotImageII: UIImageView = {
        let dotImageII = UIImageView()
        dotImageII.frame = .init(x: 0, y: 0, width: 5, height: 5)
        dotImageII.image = UIImage(named: "dot")
        return dotImageII
    }()
    
    lazy var graduateDescription: UILabel = {
        let graduateDescription = UILabel()
        graduateDescription.textColor = UIColor(named: "GrayLabels")
        graduateDescription.textAlignment = .left
        graduateDescription.numberOfLines = 0
        return graduateDescription
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
        cellView.addSubview(schoolName)
        cellView.addSubview(dotImage)
        cellView.addSubview(graduateName)
        cellView.addSubview(dotImageII)
        cellView.addSubview(graduateDescription)

        cellView.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        schoolName.translatesAutoresizingMaskIntoConstraints = false
        dotImage.translatesAutoresizingMaskIntoConstraints = false
        graduateName.translatesAutoresizingMaskIntoConstraints = false
        dotImageII.translatesAutoresizingMaskIntoConstraints = false
        graduateDescription.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            cellView.widthAnchor.constraint(equalTo: widthAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            
            iconImage.topAnchor.constraint(equalTo: topAnchor),
            iconImage.leadingAnchor.constraint(equalTo: leading),
            
            schoolName.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            schoolName.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            
            dotImage.topAnchor.constraint(equalTo: schoolName.bottomAnchor, constant: 10),
            dotImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            
            graduateName.centerYAnchor.constraint(equalTo: dotImage.centerYAnchor),
            graduateName.leadingAnchor.constraint(equalTo: dotImage.trailingAnchor, constant: 5),
            
            dotImageII.topAnchor.constraint(equalTo: dotImage.bottomAnchor, constant: 10),
            dotImageII.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            
            graduateDescription.topAnchor.constraint(equalTo: graduateName.bottomAnchor, constant: -1),
            graduateDescription.leadingAnchor.constraint(equalTo: dotImageII.trailingAnchor, constant: 5),
            graduateDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            schoolName.font = UIFont(name: "Nunito-Bold", size: 16)
            
            graduateName.font = UIFont(name: "Nunito-SemiBold", size: 10)
            
            graduateDescription.font = UIFont(name: "Nunito-SemiBold", size: 10)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 35),
                iconImage.heightAnchor.constraint(equalToConstant: 35)
                
            ])
            
        } else {
            
            schoolName.font = UIFont(name: "Nunito-Bold", size: 18)
            
            graduateName.font = UIFont(name: "Nunito-SemiBold", size: 12)
            
            graduateDescription.font = UIFont(name: "Nunito-SemiBold", size: 12)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 40),
                iconImage.heightAnchor.constraint(equalToConstant: 40)
                
            ])
        }
        
    }
    
}
