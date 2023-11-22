//
//  PassionsViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 17.10.2023.
//

import UIKit

class PassionsViewCell: UICollectionViewCell {
    
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
    lazy var polaroidFrame: UIImageView = {
        let frame = UIImageView()
        frame.image = UIImage(named: "Polaroid Frame")
        frame.layer.cornerRadius = 10
        return frame
    }()
    
    lazy var imageI: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 2
        image.clipsToBounds = true
        return image
    }()
    
    lazy var dateName: UILabel = {
        let date = UILabel()
        date.font = UIFont(name: "Nunito-Black", size: 10)
        date.textColor = UIColor(named: "OrangeTitle")
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
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            configureLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    //MARK: Configuring Layout
    private func configureLayout() {
        
        let leading = layoutMarginsGuide.leadingAnchor
        let trailing = layoutMarginsGuide.trailingAnchor
        
        addSubview(polaroidFrame)
        polaroidFrame.addSubview(imageI)
        addSubview(dateName)
        polaroidFrame.addSubview(thoughts)

        polaroidFrame.translatesAutoresizingMaskIntoConstraints = false
        imageI.translatesAutoresizingMaskIntoConstraints = false
        dateName.translatesAutoresizingMaskIntoConstraints = false
        thoughts.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            
            polaroidFrame.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            polaroidFrame.leadingAnchor.constraint(equalTo: leading),
            polaroidFrame.trailingAnchor.constraint(equalTo: trailing),
            polaroidFrame.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            imageI.heightAnchor.constraint(equalToConstant: ((ConstraintsManager.height * 0.6) - 20)),
            imageI.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            imageI.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageI.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            dateName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            dateName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            thoughts.topAnchor.constraint(equalTo: imageI.bottomAnchor, constant: 10),
            thoughts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            thoughts.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        
        ])
        
        
        
    }
    
    
    
    
}
