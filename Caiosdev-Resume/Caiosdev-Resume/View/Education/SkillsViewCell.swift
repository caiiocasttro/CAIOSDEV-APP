//
//  SkillsViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit

class SkillsViewCell: UITableViewCell {
    
    //MARK: Objects
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.text = "My Skills"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
//        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var skill: UILabel = {
        let skill = UILabel()
        skill.textColor = UIColor(named: "BlackSecondary")
        skill.font = UIFont(name: "Nunito-Bold", size: 16)
        skill.textAlignment = .right
        return skill
    }()
    
    lazy var spaceView: UIView = {
        let space = UIView()
        space.frame = .init(x: 0, y: 0, width: 20, height: 1)
        return space
    }()
    
    lazy var skillLevel: UIImageView = {
        let level = UIImageView()
        level.frame = .init(x: 0, y: 0, width: 100, height: 5)
        return level
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
        
        for i in 0..<MySkillsModel.skills.count {
            
            guard let skillData = MySkillsModel(rawValue: MySkillsModel.skills[i]) else { continue }
            
            let rowView = UIView()

            let skill = UILabel()
            skill.text = skillData.rawValue
            skill.textColor = UIColor(named: "BlackSecondary")
            skill.font = UIFont(name: "Nunito-Bold", size: 16)
            skill.textAlignment = .right
            
            let space = UIView()
            
            let level = UIImageView()
            level.image = UIImage(named: skillData.level)
            
            
            backgroundColor = UIColor.clear
            
            addSubview(cellTitle)
            addSubview(cellView)
            addSubview(stackView)
            rowView.addSubview(skill)
            rowView.addSubview(space)
            rowView.addSubview(level)
            
            stackView.addArrangedSubview(rowView)
            
            cellTitle.translatesAutoresizingMaskIntoConstraints = false
            cellView.translatesAutoresizingMaskIntoConstraints = false
            stackView.translatesAutoresizingMaskIntoConstraints = false
            rowView.translatesAutoresizingMaskIntoConstraints = false
            skill.translatesAutoresizingMaskIntoConstraints = false
            space.translatesAutoresizingMaskIntoConstraints = false
            level.translatesAutoresizingMaskIntoConstraints = false
            
            
            
            NSLayoutConstraint.activate([
                
                cellTitle.topAnchor.constraint(equalTo: topAnchor),
                cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                
                cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor),
                cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
                
                stackView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
                stackView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
                stackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
                
                space.widthAnchor.constraint(equalToConstant: 20),
                space.heightAnchor.constraint(equalToConstant: 1),
                
                skill.trailingAnchor.constraint(equalTo: space.leadingAnchor),
                skill.topAnchor.constraint(equalTo: rowView.topAnchor, constant: 5),
                skill.bottomAnchor.constraint(equalTo: rowView.bottomAnchor, constant: -5),
                space.centerXAnchor.constraint(equalTo: rowView.centerXAnchor),
                level.centerYAnchor.constraint(equalTo: skill.centerYAnchor),
                level.leadingAnchor.constraint(equalTo: space.trailingAnchor),
                
                
                
            ])
        }
    }
}
