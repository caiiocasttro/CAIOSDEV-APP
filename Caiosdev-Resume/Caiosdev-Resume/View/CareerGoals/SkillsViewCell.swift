//
//  SkillsViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit

class SkillsViewCell: UITableViewCell {
    
    //MARK: Proprieties
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
    
    lazy var skillName: UILabel = {
        let label = UILabel()
        label.text = "Skill"
        label.textColor = UIColor(named: "BlackSecondary")
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var levelBackground: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(named: "GreenLevel")
        background.layer.cornerRadius = 10
        background.clipsToBounds = true
        return background
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
        
        var space: CGFloat = 0
        
        addSubview(cellTitle)
        addSubview(cellView)
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cellTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cellView.heightAnchor.constraint(equalToConstant: 495)
            
        ])
        
        for i in 0..<15 {
            
            space += 30
            
            if i == 0 {
                
                let skill = UILabel()
                skill.text = CareerGoalsModel.initialSkills[i]
                skill.textColor = UIColor(named: "BlackSecondary")
                skill.font = .systemFont(ofSize: 16, weight: .bold)
                skill.textAlignment = .left
                
                let levelName = UILabel()
                levelName.text = CareerGoalsModel.skillsLevel[i]
                levelName.textColor = UIColor.white
                levelName.font = .systemFont(ofSize: 12, weight: .semibold)
                levelName.textAlignment = .center
                
                let background = UIView()
                if i == 3 {
                    background.backgroundColor = UIColor(named: "YellowLevel")
                } else {
                    background.backgroundColor = UIColor(named: "GreenLevel")
                }
                background.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
                background.layer.shadowRadius = 4
                background.layer.shadowOpacity = 0.5
                background.layer.shadowOffset = CGSize(width: 0, height: 0)
                background.layer.cornerRadius = 5
                background.clipsToBounds = true
                
                cellView.addSubview(skill)
                cellView.addSubview(background)
                background.addSubview(levelName)
                
                skill.translatesAutoresizingMaskIntoConstraints = false
                background.translatesAutoresizingMaskIntoConstraints = false
                levelName.translatesAutoresizingMaskIntoConstraints = false
                
                skill.topAnchor.constraint(equalTo: cellView.topAnchor, constant: space).isActive = true
                skill.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20).isActive = true
                
                background.widthAnchor.constraint(equalToConstant: 100).isActive = true
                background.heightAnchor.constraint(equalToConstant: 20).isActive = true
                background.topAnchor.constraint(equalTo: cellView.topAnchor, constant: space).isActive = true
                background.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20).isActive = true
                
                levelName.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
                levelName.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
                
            } else {
                
                let skill = UILabel()
                skill.text = CareerGoalsModel.initialSkills[i]
                skill.textColor = UIColor(named: "BlackSecondary")
                skill.font = .systemFont(ofSize: 16, weight: .bold)
                skill.textAlignment = .left
                
                let levelName = UILabel()
                levelName.text = CareerGoalsModel.skillsLevel[i]
                levelName.textColor = UIColor.white
                levelName.font = .systemFont(ofSize: 12, weight: .semibold)
                levelName.textAlignment = .center
                
                let background = UIView()
                if i == 3 {
                    background.backgroundColor = UIColor(named: "YellowLevel")
                } else {
                    background.backgroundColor = UIColor(named: "GreenLevel")
                }
                background.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
                background.layer.shadowRadius = 4
                background.layer.shadowOpacity = 0.5
                background.layer.shadowOffset = CGSize(width: 0, height: 0)
                background.layer.cornerRadius = 5
                background.clipsToBounds = true
                
                cellView.addSubview(skill)
                cellView.addSubview(background)
                background.addSubview(levelName)
                
                skill.translatesAutoresizingMaskIntoConstraints = false
                background.translatesAutoresizingMaskIntoConstraints = false
                levelName.translatesAutoresizingMaskIntoConstraints = false
                
                skill.topAnchor.constraint(equalTo: cellView.topAnchor, constant: space).isActive = true
                skill.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20).isActive = true
                
                background.widthAnchor.constraint(equalToConstant: 100).isActive = true
                background.heightAnchor.constraint(equalToConstant: 20).isActive = true
                background.topAnchor.constraint(equalTo: cellView.topAnchor, constant: space).isActive = true
                background.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20).isActive = true
                
                levelName.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
                levelName.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
                
            }
        }
    }
}
