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
        title.font = .systemFont(ofSize: 15, weight: .bold)
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
    
    lazy var portuguese: UILabel = {
        let label = UILabel()
        label.text = "Portuguese"
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var portugueseLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.2)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        return line
    }()
    
    lazy var portugueseLevel: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "GreenLevel")
        line.layer.cornerRadius = 1.5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var english: UILabel = {
        let label = UILabel()
        label.text = "English"
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var englishLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.2)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        return line
    }()
    
    lazy var englishLevel: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "GreenLevel")
        line.layer.cornerRadius = 1.5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var french: UILabel = {
        let label = UILabel()
        label.text = "French"
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var frenchLevelBackground: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")?.withAlphaComponent(0.2)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        return line
    }()
    
    lazy var frenchLevel: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "YellowLevel")
        line.layer.cornerRadius = 1.5
        line.clipsToBounds = true
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
        
        backgroundColor = UIColor(named: "WhiteBackground")
        
        //Adding subviews
        addSubview(cellTitle)
        addSubview(cellView)
        cellView.addSubview(portuguese)
        cellView.addSubview(portugueseLevelBackground)
        cellView.addSubview(english)
        cellView.addSubview(englishLevelBackground)
        cellView.addSubview(french)
        cellView.addSubview(frenchLevelBackground)
        portugueseLevelBackground.addSubview(portugueseLevel)
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
            cellView.heightAnchor.constraint(equalToConstant: 170),
        
            portuguese.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            portuguese.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            portugueseLevelBackground.topAnchor.constraint(equalTo: portuguese.bottomAnchor, constant: 5),
            portugueseLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            portugueseLevelBackground.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            portugueseLevelBackground.heightAnchor.constraint(equalToConstant: 6),
            
            portugueseLevel.centerYAnchor.constraint(equalTo: portugueseLevelBackground.centerYAnchor),
            portugueseLevel.leadingAnchor.constraint(equalTo: portugueseLevelBackground.leadingAnchor, constant: 2),
            portugueseLevel.trailingAnchor.constraint(equalTo: portugueseLevelBackground.trailingAnchor, constant: -2 ),
            portugueseLevel.heightAnchor.constraint(equalToConstant: 3),
            
            english.topAnchor.constraint(equalTo: portugueseLevelBackground.bottomAnchor, constant: 20),
            english.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            englishLevelBackground.topAnchor.constraint(equalTo: english.bottomAnchor, constant: 5),
            englishLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            englishLevelBackground.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            englishLevelBackground.heightAnchor.constraint(equalToConstant: 6),
            
            englishLevel.centerYAnchor.constraint(equalTo: englishLevelBackground.centerYAnchor),
            englishLevel.leadingAnchor.constraint(equalTo: englishLevelBackground.leadingAnchor, constant: 2),
            englishLevel.widthAnchor.constraint(equalTo: englishLevelBackground.widthAnchor, multiplier: 0.8),
            englishLevel.heightAnchor.constraint(equalToConstant: 3),
            
            french.topAnchor.constraint(equalTo: englishLevelBackground.bottomAnchor, constant: 20),
            french.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            
            frenchLevelBackground.topAnchor.constraint(equalTo: french.bottomAnchor, constant: 5),
            frenchLevelBackground.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            frenchLevelBackground.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            frenchLevelBackground.heightAnchor.constraint(equalToConstant: 6),
            
            frenchLevel.centerYAnchor.constraint(equalTo: frenchLevelBackground.centerYAnchor),
            frenchLevel.leadingAnchor.constraint(equalTo: frenchLevelBackground.leadingAnchor, constant: 2),
            frenchLevel.widthAnchor.constraint(equalTo: frenchLevelBackground.widthAnchor, multiplier: 0.2),
            frenchLevel.heightAnchor.constraint(equalToConstant: 3),
            
            
        
        ])
        
    }

}
