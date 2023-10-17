//
//  ExperienceViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit

class ExperienceViewCell: UITableViewCell {
    
    //MARK: Proprieties
    var position: String? {
        didSet {
            guard let name = position else { return }
            
            positionName.text = name
        }
    }
    
    var location: String? {
        didSet {
            guard let name = location else { return }
            
            locationName.text = name
        }
    }
    
    var taskI: String? {
        didSet {
            guard let name = taskI else { return }
            
            taskNameI.text = name
        }
    }
    
    var taskII: String? {
        didSet {
            guard let name = taskII else { return }
            
            taskNameII.text = name
        }
    }
    
    var taskIII: String? {
        didSet {
            guard let name = taskIII else { return }
            
            taskNameIII.text = name
        }
    }
    
    //MARK: Objects
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.frame = .init(x: 0, y: 0, width: 6, height: 140)
        line.layer.cornerRadius = 3
        line.clipsToBounds = true
        
        let gradient = CAGradientLayer()
        gradient.frame = line.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        
        line.layer.addSublayer(gradient)
        
        return line
    }()
    
    lazy var positionName: UILabel = {
        let name = UILabel()
        name.text = "iOS Developer Freelancer"
        name.font = UIFont(name: "Nunito-Black", size: 20)
        name.textColor = UIColor(named: "BlackSecondary")
        name.textAlignment = .left
        return  name
    }()
    
    lazy var locationName: UILabel = {
        let location = UILabel()
        location.text = "Sky Switzerland, Neuchâtel, VD - Sep 2023 · 1 mo"
        location.font = UIFont(name: "Nunito-Bold", size: 12)
        location.textColor = UIColor(named: "GrayLabels")
        location.textAlignment = .left
        location.numberOfLines = 0
        return location
    }()
    
    lazy var circleTaskI: UIView = {
        let circle = UIView()
        circle.frame = .init(x: 0, y: 0, width: 5, height: 5)
        circle.backgroundColor = UIColor(named: "BlackLabels")
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.clipsToBounds = true
        return circle
    }()
    
    lazy var circleTaskII: UIView = {
        let circle = UIView()
        circle.frame = .init(x: 0, y: 0, width: 5, height: 5)
        circle.backgroundColor = UIColor(named: "BlackLabels")
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.clipsToBounds = true
        return circle
    }()
    
    lazy var circleTaskIII: UIView = {
        let circle = UIView()
        circle.frame = .init(x: 0, y: 0, width: 5, height: 5)
        circle.backgroundColor = UIColor(named: "BlackLabels")
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.clipsToBounds = true
        return circle
    }()
    
    lazy var taskNameI: UILabel = {
        let position = UILabel()
        position.text = "New features implementation on iOS app."
        position.font = UIFont(name: "Nunito-SemiBold", size: 12)
        position.textColor = UIColor(named: "GrayLabels")
        position.textAlignment = .left
        return position
    }()
    
    lazy var taskNameII: UILabel = {
        let position = UILabel()
        position.text = "iOS application maintenance."
        position.font = UIFont(name: "Nunito-SemiBold", size: 12)
        position.textColor = UIColor(named: "GrayLabels")
        position.textAlignment = .left
        return position
    }()
    
    lazy var taskNameIII: UILabel = {
        let position = UILabel()
        position.text = "Improving existing iOS app."
        position.font = UIFont(name: "Nunito-SemiBold", size: 12)
        position.textColor = UIColor(named: "GrayLabels")
        position.textAlignment = .left
        return position
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

        addSubview(cellView)
        cellView.addSubview(line)
        cellView.sendSubviewToBack(line)
        cellView.addSubview(positionName)
        cellView.addSubview(locationName)
        cellView.addSubview(circleTaskI)
        cellView.addSubview(circleTaskII)
        cellView.addSubview(circleTaskIII)
        cellView.addSubview(taskNameI)
        cellView.addSubview(taskNameII)
        cellView.addSubview(taskNameIII)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        positionName.translatesAutoresizingMaskIntoConstraints = false
        locationName.translatesAutoresizingMaskIntoConstraints = false
        circleTaskI.translatesAutoresizingMaskIntoConstraints = false
        circleTaskII.translatesAutoresizingMaskIntoConstraints = false
        circleTaskIII.translatesAutoresizingMaskIntoConstraints = false
        taskNameI.translatesAutoresizingMaskIntoConstraints = false
        taskNameII.translatesAutoresizingMaskIntoConstraints = false
        taskNameIII.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cellView.heightAnchor.constraint(equalToConstant: 180),
            
            line.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            line.widthAnchor.constraint(equalToConstant: 6),
            line.heightAnchor.constraint(equalToConstant: 100),
            
            positionName.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            positionName.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 10),
            
            locationName.topAnchor.constraint(equalTo: positionName.bottomAnchor),
            locationName.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 10),
            
            circleTaskI.topAnchor.constraint(equalTo: locationName.bottomAnchor, constant: 20),
            circleTaskI.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 20),
            circleTaskI.widthAnchor.constraint(equalToConstant: 5),
            circleTaskI.heightAnchor.constraint(equalToConstant: 5),
            
            circleTaskII.topAnchor.constraint(equalTo: circleTaskI.bottomAnchor, constant: 20),
            circleTaskII.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 20),
            circleTaskII.widthAnchor.constraint(equalToConstant: 5),
            circleTaskII.heightAnchor.constraint(equalToConstant: 5),
            
            circleTaskIII.topAnchor.constraint(equalTo: circleTaskII.bottomAnchor, constant: 20),
            circleTaskIII.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 20),
            circleTaskIII.widthAnchor.constraint(equalToConstant: 5),
            circleTaskIII.heightAnchor.constraint(equalToConstant: 5),
            
            taskNameI.centerYAnchor.constraint(equalTo: circleTaskI.centerYAnchor),
            taskNameI.leadingAnchor.constraint(equalTo: circleTaskI.trailingAnchor, constant: 5),
            
            taskNameII.centerYAnchor.constraint(equalTo: circleTaskII.centerYAnchor),
            taskNameII.leadingAnchor.constraint(equalTo: circleTaskII.trailingAnchor, constant: 5),
            
            taskNameIII.centerYAnchor.constraint(equalTo: circleTaskIII.centerYAnchor),
            taskNameIII.leadingAnchor.constraint(equalTo: circleTaskIII.trailingAnchor, constant: 5)
            
        
        ])
        
    }
    

}
