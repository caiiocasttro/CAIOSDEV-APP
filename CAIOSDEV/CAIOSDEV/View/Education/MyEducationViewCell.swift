//
//  MyEducationViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 21.11.2023.
//

import UIKit

class MyEducationViewCell: UITableViewCell {
    
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
    
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.text = "My certificates"
        title.textColor = UIColor(named: "BlackSecondary")
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
        backgroundColor = UIColor.clear
        
        let leading = layoutMarginsGuide.leadingAnchor
        
        addSubview(cellView)
        cellView.addSubview(iconImage)
        cellView.addSubview(cellTitle)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cellView.widthAnchor.constraint(equalTo: widthAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            iconImage.leadingAnchor.constraint(equalTo: leading),
            iconImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            
            cellTitle.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            cellTitle.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor)
        
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            cellTitle.font = UIFont(name: "Nunito-Black", size: 18)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 35),
                iconImage.heightAnchor.constraint(equalToConstant: 35)
                
            ])
            
        } else {
            
            cellTitle.font = UIFont(name: "Nunito-Black", size: 20)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 40),
                iconImage.heightAnchor.constraint(equalToConstant: 40)
                
            ])
        }
    }

}
