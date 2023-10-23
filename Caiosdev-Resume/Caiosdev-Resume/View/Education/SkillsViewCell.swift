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
        
        var space: CGFloat = 0
        
        addSubview(cellTitle)
        addSubview(cellView)
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellTitle.topAnchor.constraint(equalTo: topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cellView.heightAnchor.constraint(equalToConstant: 495)
            
        ])
        
        for i in 0..<MySkillsModel.skills.count {
            
            space += 30
            
            let skill = UILabel()
            skill.text = MySkillsModel.skills[i]
            skill.textColor = UIColor(named: "BlackSecondary")
            skill.font = UIFont(name: "Nunito-Bold", size: 16)
            skill.textAlignment = .right
            
            let level = UIImageView()
            level.frame = .init(x: 0, y: 0, width: 100, height: 5)
            level.image = UIImage(named: MySkillsModel.skillsLevel[i])
            
            cellView.addSubview(skill)
            cellView.addSubview(level)
            
            
            skill.translatesAutoresizingMaskIntoConstraints = false
            level.translatesAutoresizingMaskIntoConstraints = false
            
            skill.topAnchor.constraint(equalTo: cellView.topAnchor, constant: space).isActive = true
            skill.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -(UIScreen.main.bounds.width / 2)).isActive = true
            
            level.widthAnchor.constraint(equalToConstant: 100).isActive = true
            level.heightAnchor.constraint(equalToConstant: 5).isActive = true
            level.centerYAnchor.constraint(equalTo: skill.centerYAnchor).isActive = true
            level.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: (UIScreen.main.bounds.width / 2)).isActive = true
            
            
        }
    }
}
