//
//  CareerGoalsViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit

class CareerGoalsViewCell: UITableViewCell {
    
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
        title.text = "Title"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 15)
        title.textAlignment = .left
        return title
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var text: UILabel = {
        let text = UILabel()
        text.text = "Text"
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
        
        //Adding subviews
        addSubview(cellTitle)
        addSubview(cellView)
        cellView.addSubview(text)
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
            
            cellTitle.topAnchor.constraint(equalTo: topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            text.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            text.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            text.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
        
        ])
        
    }

}
