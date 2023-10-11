//
//  ExperienceViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit

class ExperienceViewCell: UITableViewCell {
    
    //MARK: Objects
    lazy var cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackLabels")
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
        
        
        addSubview(line)
        sendSubviewToBack(line)
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            line.widthAnchor.constraint(equalToConstant: 3),
            line.heightAnchor.constraint(equalToConstant: 600),
            line.topAnchor.constraint(equalTo: topAnchor),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
        
        ])
        
        for i in 0..<4 {
            
            var circleSpace: CGFloat = 20
            var positionNameSpace: CGFloat = 20
            var companysNameSpace: CGFloat = 40
            var circleISpace: CGFloat = 56
            var circleIISpace: CGFloat = 70
            var circleIIISpace: CGFloat = 84
            var responsabilityISpace: CGFloat = 53
            var responsabilityIISpace: CGFloat = 69
            var responsabilityIIISpace: CGFloat = 83
            
            
            if i == 1 {
                circleSpace += 100
                positionNameSpace  += 100
                companysNameSpace  += 100
                circleISpace  += 100
                circleIISpace  += 100
                circleIIISpace  += 100
                responsabilityISpace  += 100
                responsabilityIISpace  += 100
                responsabilityIIISpace  += 100
            } else if i == 2 {
                circleSpace += 100
                positionNameSpace  += 100
                companysNameSpace  += 100
                circleISpace  += 100
                circleIISpace  += 100
                circleIIISpace  += 100
                responsabilityISpace  += 100
                responsabilityIISpace  += 100
                responsabilityIIISpace  += 100
            } else if i == 3 {
                circleSpace += 100
                positionNameSpace  += 100
                companysNameSpace  += 100
                circleISpace  += 100
                circleIISpace  += 100
                circleIIISpace  += 100
                responsabilityISpace  += 100
                responsabilityIISpace  += 100
                responsabilityIIISpace  += 100
            }
            
            let position = UILabel()
            position.text = MyExperienceModel.position[i]
            position.textColor = UIColor(named: "BlackLabels")
            position.font = .systemFont(ofSize: 18, weight: .semibold)
            position.textAlignment = .left
            
            let company = UILabel()
            company.text = MyExperienceModel.companies[i]
            company.textColor = UIColor(named: "GrayLabels")
            company.font = .systemFont(ofSize: 10, weight: .medium)
            company.textAlignment = .left
            
            let responsabilityI = UILabel()
            responsabilityI.text = MyExperienceModel.skySwitzerland[0]
            responsabilityI.textColor = UIColor(named: "GrayLabels")
            responsabilityI.font = .systemFont(ofSize: 10, weight: .regular)
            responsabilityI.textAlignment = .left
            responsabilityI.numberOfLines = 0
            
            let responsabilityII = UILabel()
            responsabilityII.text = MyExperienceModel.skySwitzerland[1]
            responsabilityII.textColor = UIColor(named: "GrayLabels")
            responsabilityII.font = .systemFont(ofSize: 10, weight: .regular)
            responsabilityII.textAlignment = .left
            responsabilityII.numberOfLines = 0
            
            let responsabilityIII = UILabel()
            responsabilityIII.text = MyExperienceModel.skySwitzerland[2]
            responsabilityIII.textColor = UIColor(named: "GrayLabels")
            responsabilityIII.font = .systemFont(ofSize: 10, weight: .regular)
            responsabilityIII.textAlignment = .left
            responsabilityIII.numberOfLines = 0
            
            let bigCircle = UIImageView()
            bigCircle.frame = .init(x: 0, y: 0, width: 10, height: 10)
            bigCircle.image = UIImage(named: "circle")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
            
            let circleI = UIImageView()
            circleI.frame = .init(x: 0, y: 0, width: 4, height: 4)
            circleI.image = UIImage(named: "dot")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
            
            let circleII = UIImageView()
            circleII.frame = .init(x: 0, y: 0, width: 4, height: 4)
            circleII.image = UIImage(named: "dot")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
            
            let circleIII = UIImageView()
            circleIII.frame = .init(x: 0, y: 0, width: 4, height: 4)
            circleIII.image = UIImage(named: "dot")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
            
            addSubview(bigCircle)
            addSubview(position)
            addSubview(company)
            addSubview(circleI)
            addSubview(responsabilityI)
            addSubview(circleII)
            addSubview(responsabilityII)
            addSubview(circleIII)
            addSubview(responsabilityIII)
            
            bigCircle.translatesAutoresizingMaskIntoConstraints = false
            position.translatesAutoresizingMaskIntoConstraints = false
            company.translatesAutoresizingMaskIntoConstraints = false
            circleI.translatesAutoresizingMaskIntoConstraints = false
            responsabilityI.translatesAutoresizingMaskIntoConstraints = false
            circleII.translatesAutoresizingMaskIntoConstraints = false
            responsabilityII.translatesAutoresizingMaskIntoConstraints = false
            circleIII.translatesAutoresizingMaskIntoConstraints = false
            responsabilityIII.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
            
                bigCircle.topAnchor.constraint(equalTo: topAnchor, constant: circleSpace),
                bigCircle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                
                position.topAnchor.constraint(equalTo: topAnchor, constant: positionNameSpace),
                position.leadingAnchor.constraint(equalTo: bigCircle.trailingAnchor, constant: 10),
                
                company.topAnchor.constraint(equalTo: topAnchor, constant: companysNameSpace),
                company.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                
                circleI.topAnchor.constraint(equalTo: topAnchor, constant: circleISpace),
                circleI.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                
                responsabilityI.topAnchor.constraint(equalTo: topAnchor, constant: responsabilityISpace),
                responsabilityI.leadingAnchor.constraint(equalTo: circleI.trailingAnchor, constant: 5),
                
                circleII.topAnchor.constraint(equalTo: topAnchor, constant: circleIISpace),
                circleII.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                
                responsabilityII.topAnchor.constraint(equalTo: topAnchor, constant: responsabilityIISpace),
                responsabilityII.leadingAnchor.constraint(equalTo: circleII.trailingAnchor, constant: 5),
                
                circleIII.topAnchor.constraint(equalTo: topAnchor, constant: circleIIISpace),
                circleIII.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                
                responsabilityIII.topAnchor.constraint(equalTo: topAnchor, constant: responsabilityIIISpace),
                responsabilityIII.leadingAnchor.constraint(equalTo: circleIII.trailingAnchor, constant: 5),
                
                
            
            ])
            
        }
        
        
    }
    

}
