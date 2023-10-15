//
//  EducationViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit

class EducationViewCell: UITableViewCell {
    
    lazy var cellView: UIView = {
        let view = UIView()
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
        
        var iconSpace: CGFloat = 0
        var schoolSpace: CGFloat = 10
        var dotImageSpace: CGFloat = 50
        var dotImageIISpace: CGFloat = 70
        var graduateSpace: CGFloat = 45
        var descriptionSpace: CGFloat = 65
        
        addSubview(cellView)

        cellView.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            cellView.widthAnchor.constraint(equalTo: widthAnchor),
            cellView.heightAnchor.constraint(equalToConstant: 290),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
        
        for i in 0..<3 {
            
            if i == 1  {
                iconSpace += 100
                schoolSpace += 100
                dotImageSpace += 100
                graduateSpace += 100
                dotImageIISpace += 100
                descriptionSpace += 100
            } else if i == 2 {
                iconSpace += 100
                schoolSpace += 100
                dotImageSpace += 100
                graduateSpace += 100
                dotImageIISpace += 100
                descriptionSpace += 100
            }
            
            let school = UILabel()
            school.text = MyEducationModel.school[i]
            school.textColor = UIColor(named: "BlackLabels")
            school.font = UIFont(name: "Nunito-Bold", size: 18)
            school.textAlignment = .left
            
            let graduate = UILabel()
            graduate.text = MyEducationModel.graduation
            graduate.textColor = UIColor(named: "GrayLabels")
            graduate.font = UIFont(name: "Nunito-SemiBold", size: 12)
            graduate.textAlignment = .left
            
            let graduateDescription = UILabel()
            graduateDescription.text = MyEducationModel.description[i]
            graduateDescription.textColor = UIColor(named: "GrayLabels")
            graduateDescription.font = UIFont(name: "Nunito-SemiBold", size: 12)
            graduateDescription.textAlignment = .left
            graduateDescription.numberOfLines = 0
            
            let iconImage = UIImageView()
            iconImage.frame = .init(x: 0, y: 0, width: 40, height: 40)
            iconImage.image = UIImage(named: "education")
            
            let dotImage = UIImageView()
            dotImage.frame = .init(x: 0, y: 0, width: 5, height: 5)
            dotImage.image = UIImage(named: "dot")
            
            let dotImageII = UIImageView()
            dotImageII.frame = .init(x: 0, y: 0, width: 5, height: 5)
            dotImageII.image = UIImage(named: "dot")
            
            backgroundColor = UIColor.clear
            
            cellView.addSubview(iconImage)
            cellView.addSubview(school)
            cellView.addSubview(dotImage)
            cellView.addSubview(graduate)
            cellView.addSubview(dotImageII)
            cellView.addSubview(graduateDescription)
            
            
            iconImage.translatesAutoresizingMaskIntoConstraints = false
            school.translatesAutoresizingMaskIntoConstraints = false
            dotImage.translatesAutoresizingMaskIntoConstraints = false
            graduate.translatesAutoresizingMaskIntoConstraints = false
            dotImageII.translatesAutoresizingMaskIntoConstraints = false
            graduateDescription.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                iconImage.topAnchor.constraint(equalTo: topAnchor, constant: iconSpace),
                iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                
                school.topAnchor.constraint(equalTo: topAnchor, constant: schoolSpace),
                school.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
                
                dotImage.topAnchor.constraint(equalTo: topAnchor, constant: dotImageSpace),
                dotImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                
                graduate.topAnchor.constraint(equalTo: topAnchor, constant: graduateSpace),
                graduate.leadingAnchor.constraint(equalTo: dotImage.trailingAnchor, constant: 5),
                
                dotImageII.topAnchor.constraint(equalTo: topAnchor, constant: dotImageIISpace),
                dotImageII.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                
                graduateDescription.topAnchor.constraint(equalTo: topAnchor, constant: descriptionSpace),
                graduateDescription.leadingAnchor.constraint(equalTo: dotImageII.trailingAnchor, constant: 5),
                graduateDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
                
                
            ])
            
        }
        
    }
    
}
