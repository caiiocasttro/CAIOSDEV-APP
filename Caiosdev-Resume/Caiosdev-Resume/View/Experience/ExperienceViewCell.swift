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
        line.layer.cornerRadius = 2
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
        
            line.widthAnchor.constraint(equalToConstant: 4),
            line.heightAnchor.constraint(equalToConstant: 600),
            line.topAnchor.constraint(equalTo: topAnchor),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
        
        ])
        
        for i in 0..<5 {
            
            var circleSpace: CGFloat = 25
            var positionNameSpace: CGFloat = 20
            var companysNameSpace: CGFloat = 40
            var circleISpace: CGFloat = 58
            var circleIISpace: CGFloat = 72
            var circleIIISpace: CGFloat = 86
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
                circleSpace += 200
                positionNameSpace  += 200
                companysNameSpace  += 200
                circleISpace  += 200
                circleIISpace  += 200
                circleIIISpace  += 200
                responsabilityISpace  += 200
                responsabilityIISpace  += 200
                responsabilityIIISpace  += 200
            } else if i == 3 {
                circleSpace += 300
                positionNameSpace  += 300
                companysNameSpace  += 300
                circleISpace  += 300
                circleIISpace  += 300
                circleIIISpace  += 300
                responsabilityISpace  += 300
                responsabilityIISpace  += 300
                responsabilityIIISpace  += 300
            } else if i == 4 {
                circleSpace += 400
                positionNameSpace  += 400
                companysNameSpace  += 400
                circleISpace  += 400
                circleIISpace  += 400
                circleIIISpace  += 400
                responsabilityISpace  += 400
                responsabilityIISpace  += 400
                responsabilityIIISpace  += 400
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
            responsabilityI.text = MyExperienceModel.malt[0]
            responsabilityI.textColor = UIColor(named: "GrayLabels")
            responsabilityI.font = .systemFont(ofSize: 10, weight: .regular)
            responsabilityI.textAlignment = .left
            responsabilityI.numberOfLines = 0
            
            let responsabilityII = UILabel()
            responsabilityII.text = MyExperienceModel.malt[1]
            responsabilityII.textColor = UIColor(named: "GrayLabels")
            responsabilityII.font = .systemFont(ofSize: 10, weight: .regular)
            responsabilityII.textAlignment = .left
            responsabilityII.numberOfLines = 0
            
            let responsabilityIII = UILabel()
            responsabilityIII.text = MyExperienceModel.malt[2]
            responsabilityIII.textColor = UIColor(named: "GrayLabels")
            responsabilityIII.font = .systemFont(ofSize: 10, weight: .regular)
            responsabilityIII.textAlignment = .left
            responsabilityIII.numberOfLines = 0
            
            if i == 1 {
                responsabilityI.text = MyExperienceModel.skySwitzerland[0]
                responsabilityII.text = MyExperienceModel.skySwitzerland[1]
                responsabilityIII.text = MyExperienceModel.skySwitzerland[2]
            } else if i == 2 {
                responsabilityI.text = MyExperienceModel.eccosalva[0]
                responsabilityII.text = MyExperienceModel.eccosalva[1]
                responsabilityIII.text = MyExperienceModel.eccosalva[2]
            } else if i == 3 {
                responsabilityI.text = MyExperienceModel.arcor[0]
                responsabilityII.text = MyExperienceModel.arcor[1]
                responsabilityIII.text = MyExperienceModel.arcor[2]
            } else if i == 4 {
                responsabilityI.text = MyExperienceModel.motiva[0]
                responsabilityII.text = MyExperienceModel.motiva[1]
                responsabilityIII.text = MyExperienceModel.motiva[2]
            }
            
            
            
            let bigCircle = UIImageView()
            bigCircle.frame = .init(x: 0, y: 0, width: 12, height: 12)
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
                bigCircle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
                
                position.topAnchor.constraint(equalTo: topAnchor, constant: positionNameSpace),
                position.leadingAnchor.constraint(equalTo: bigCircle.trailingAnchor, constant: 10),
                
                company.topAnchor.constraint(equalTo: topAnchor, constant: companysNameSpace),
                company.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38),
                
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
