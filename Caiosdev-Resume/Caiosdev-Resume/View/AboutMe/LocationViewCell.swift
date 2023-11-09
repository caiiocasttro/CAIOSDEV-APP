//
//  LocationViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit

class LocationViewCell: UITableViewCell {
    
    //MARK: Proprieties
    var title: String? {
        didSet {
            guard let string = title else { return }
            
            cellTitle.text = string
        }
    }
    
    var textString: String? {
        didSet {
            guard let string = textString else { return }
            
            text.text = string
        }
    }
    
    //MARK: Objects
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 15)
        title.textAlignment = .left
        return title
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var iconLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        return image
    }()
    
    lazy var text: UILabel = {
        let text = UILabel()
        text.textColor = UIColor(named: "BlackSecondary")
        text.font = UIFont(name: "Nunito-SemiBold", size: 12)
        text.numberOfLines = 0
        text.textAlignment = .left
        return text
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
        
        let trailing = layoutMarginsGuide.trailingAnchor

        addSubview(cellTitle)
        addSubview(cellView)
        cellView.addSubview(iconLocation)
        cellView.addSubview(text)
        
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        iconLocation.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cellTitle.topAnchor.constraint(equalTo: topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leading),
            cellView.trailingAnchor.constraint(equalTo: trailing),
            cellView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            iconLocation.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            iconLocation.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            iconLocation.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            iconLocation.widthAnchor.constraint(equalToConstant: 30),
            iconLocation.heightAnchor.constraint(equalToConstant: 30),
            
            text.leadingAnchor.constraint(equalTo: iconLocation.trailingAnchor, constant: 10),
            text.centerYAnchor.constraint(equalTo: iconLocation.centerYAnchor)
        
        ])
        
        
    }

}
