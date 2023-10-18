//
//  LanguagesViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit

class LanguagesViewCell: UITableViewCell {
    
    //MARK: Properties
    var title: String? {
        didSet {
            guard let string = title else { return }
            
            cellTitle.text = string
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
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var portuguese: UILabel = {
        let label = UILabel()
        label.text = "Portuguese"
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = UIFont(name: "Nunito-SemiBold", size: 14)
        return label
    }()
    
    lazy var portugueseLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.1)
        line.layer.cornerRadius = 5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var portugueseLevel: UIView = {
        let line = UIView()
        line.frame = .init(x: 0, y: 0, width: 296, height: 6)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        
        let gradient = CAGradientLayer()
        gradient.frame = line.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        line.layer.addSublayer(gradient)
        
        return line
    }()
    
    lazy var english: UILabel = {
        let label = UILabel()
        label.text = "English"
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = UIFont(name: "Nunito-SemiBold", size: 14)
        return label
    }()
    
    lazy var englishLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.1)
        line.layer.cornerRadius = 5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var englishLevel: UIView = {
        let line = UIView()
        line.frame = .init(x: 0, y: 0, width: 220, height: 6)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        
        
        let gradient = CAGradientLayer()
        gradient.frame = line.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        line.layer.addSublayer(gradient)
        return line
    }()
    
    lazy var french: UILabel = {
        let label = UILabel()
        label.text = "French"
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = UIFont(name: "Nunito-SemiBold", size: 14)
        return label
    }()
    
    lazy var frenchLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.1)
        line.layer.cornerRadius = 5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var frenchLevel: UIView = {
        let line = UIView()
        line.frame = .init(x: 0, y: 0, width: 50, height: 6)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        
        let gradient = CAGradientLayer()
        gradient.frame = line.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        line.layer.addSublayer(gradient)
        return line
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
        cellView.addSubview(portuguese)
        cellView.addSubview(portugueseLevelBackground)
        cellView.addSubview(english)
        cellView.addSubview(englishLevelBackground)
        cellView.addSubview(french)
        cellView.addSubview(frenchLevelBackground)
        cellView.addSubview(portugueseLevel)
        englishLevelBackground.addSubview(englishLevel)
        frenchLevelBackground.addSubview(frenchLevel)
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        portuguese.translatesAutoresizingMaskIntoConstraints = false
        english.translatesAutoresizingMaskIntoConstraints = false
        french.translatesAutoresizingMaskIntoConstraints = false
        portugueseLevelBackground.translatesAutoresizingMaskIntoConstraints = false
        englishLevelBackground.translatesAutoresizingMaskIntoConstraints = false
        frenchLevelBackground.translatesAutoresizingMaskIntoConstraints = false
        portugueseLevel.translatesAutoresizingMaskIntoConstraints = false
        englishLevel.translatesAutoresizingMaskIntoConstraints = false
        frenchLevel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellTitle.topAnchor.constraint(equalTo: topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cellView.heightAnchor.constraint(equalToConstant: 190),
            
            portuguese.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            portuguese.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            portugueseLevelBackground.topAnchor.constraint(equalTo: portuguese.bottomAnchor, constant: 5),
            portugueseLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            portugueseLevelBackground.widthAnchor.constraint(equalToConstant: 300),
            portugueseLevelBackground.heightAnchor.constraint(equalToConstant: 10),
            
            portugueseLevel.centerYAnchor.constraint(equalTo: portugueseLevelBackground.centerYAnchor),
            portugueseLevel.leadingAnchor.constraint(equalTo: portugueseLevelBackground.leadingAnchor, constant: 2),
            portugueseLevel.trailingAnchor.constraint(equalTo: portugueseLevelBackground.trailingAnchor, constant: -2),
            portugueseLevel.widthAnchor.constraint(equalToConstant: 296),
            portugueseLevel.heightAnchor.constraint(equalToConstant: 6),
            
            english.topAnchor.constraint(equalTo: portugueseLevelBackground.bottomAnchor, constant: 20),
            english.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            englishLevelBackground.topAnchor.constraint(equalTo: english.bottomAnchor, constant: 5),
            englishLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            englishLevelBackground.widthAnchor.constraint(equalToConstant: 300),
            englishLevelBackground.heightAnchor.constraint(equalToConstant: 10),
            
            englishLevel.centerYAnchor.constraint(equalTo: englishLevelBackground.centerYAnchor),
            englishLevel.leadingAnchor.constraint(equalTo: englishLevelBackground.leadingAnchor, constant: 2),
            englishLevel.widthAnchor.constraint(equalToConstant: 220),
            englishLevel.heightAnchor.constraint(equalToConstant: 6),
            
            french.topAnchor.constraint(equalTo: englishLevelBackground.bottomAnchor, constant: 20),
            french.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            frenchLevelBackground.topAnchor.constraint(equalTo: french.bottomAnchor, constant: 5),
            frenchLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            frenchLevelBackground.widthAnchor.constraint(equalToConstant: 300),
            frenchLevelBackground.heightAnchor.constraint(equalToConstant: 10),
            
            frenchLevel.centerYAnchor.constraint(equalTo: frenchLevelBackground.centerYAnchor),
            frenchLevel.leadingAnchor.constraint(equalTo: frenchLevelBackground.leadingAnchor, constant: 2),
            frenchLevel.widthAnchor.constraint(equalToConstant: 50),
            frenchLevel.heightAnchor.constraint(equalToConstant: 6),
            
            
            
        ])
        
        
    }
    
}
