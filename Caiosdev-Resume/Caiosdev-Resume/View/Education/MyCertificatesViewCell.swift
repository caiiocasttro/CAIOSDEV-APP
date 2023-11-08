//
//  MyCertificatesViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 19.10.2023.
//

import UIKit

class MyCertificatesViewCell: UITableViewCell {
    
    //MARK: Objects
    lazy var cellView: UIView = {
        let view = UIView()
        return view
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
        cellView.addSubview(cellTitle)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cellView.widthAnchor.constraint(equalTo: widthAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cellTitle.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leading)
        
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            cellTitle.font = UIFont(name: "Nunito-Black", size: 18)
            
        } else {
            
            cellTitle.font = UIFont(name: "Nunito-Black", size: 20)
        }
    }

}
