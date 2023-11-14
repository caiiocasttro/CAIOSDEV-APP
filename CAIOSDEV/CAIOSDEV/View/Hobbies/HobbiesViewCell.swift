//
//  HobbiesViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 17.10.2023.
//

import UIKit

class HobbiesViewCell: UITableViewCell {
    
    //MARK: Proprieties
    var image: String? {
        didSet {
            guard let string = image else { return }
            
            imageI.image = UIImage(named: string)
        }
    }
    
    var text: String? {
        didSet {
            guard let string = text else { return }
            
            thoughts.text = string
        }
    }
    
    var date: String? {
        didSet {
            guard let string = date else { return }
            
            dateName.text = string
        }
    }
    
    //MARK: Objects
    lazy var imageI: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    lazy var dateView: UIView = {
        let view = UIView()
        view.frame = .init(x: 0, y: 0, width: 60, height: 20)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(red: 0.61, green: 0.17, blue: 0.47, alpha: 0.7).cgColor, UIColor(red: 0.8, green: 0.06, blue: 0.3, alpha: 0.8).cgColor, UIColor(red: 0.88, green: 0.3, blue: 0.16, alpha: 0.8).cgColor, UIColor(red: 0.99, green: 0.52, blue: 0.12, alpha: 0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        view.layer.addSublayer(gradient)
        return view
    }()
    
    lazy var dateName: UILabel = {
        let date = UILabel()
        date.font = UIFont(name: "Nunito-Bold", size: 10)
        date.textColor = UIColor.white
        date.textAlignment = .left
        date.numberOfLines = 0
        return date
    }()
    
    lazy var thoughts: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-Bold", size: 14)
        label.textColor = UIColor(named: "BlackSecondary")
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Configuring Layout
    private func configureLayout() {
        
        let leading = layoutMarginsGuide.leadingAnchor
        let trailing = layoutMarginsGuide.trailingAnchor
        
        addSubview(imageI)
        imageI.addSubview(dateView)
        dateView.addSubview(dateName)
        addSubview(thoughts)

        
        imageI.translatesAutoresizingMaskIntoConstraints = false
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateName.translatesAutoresizingMaskIntoConstraints = false
        thoughts.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            imageI.heightAnchor.constraint(equalToConstant: 450),
            imageI.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageI.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageI.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            dateView.widthAnchor.constraint(equalToConstant: 60),
            dateView.heightAnchor.constraint(equalToConstant: 20),
            dateView.bottomAnchor.constraint(equalTo: imageI.bottomAnchor, constant: -10),
            dateView.leadingAnchor.constraint(equalTo: imageI.leadingAnchor, constant: 10),
            
            dateName.centerXAnchor.constraint(equalTo: dateView.centerXAnchor),
            dateName.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            
            thoughts.topAnchor.constraint(equalTo: imageI.bottomAnchor, constant: 5),
            thoughts.leadingAnchor.constraint(equalTo: leading),
            thoughts.trailingAnchor.constraint(equalTo: trailing),
            thoughts.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            
        
        ])
        
        
        
    }
    
    
    
    
}
