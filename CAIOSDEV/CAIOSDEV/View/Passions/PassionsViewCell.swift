//
//  PassionsViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 17.10.2023.
//

import UIKit
/**
 Custom UICollectionViewCell for displaying passion-related content.
 
 This cell consists of a polaroid-style frame with an image, a number label, and a thoughts label.
 
 - Important:
   This cell assumes that the images and other assets are available in the app's asset catalog.
 
 - Note:
   The design of the cell is responsive to different screen sizes, and the font size of the 'thoughts' label adjusts for iPhone 5.
 
 Usage Example:
 ```swift
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PassionsCell", for: indexPath) as! PassionsViewCell
 cell.image = "passion_image"
 cell.text = "Passionate Thought"
 cell.number = "1"
 return cell
 */
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
    
    var number: String? {
        didSet {
            guard let string = number else { return }
            
            picNumber.text = string
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
    
    lazy var picNumber: UILabel = {
        let date = UILabel()
        date.font = UIFont(name: "Nunito-Black", size: 10)
        date.textColor = UIColor(named: "OrangeTitle")
        date.textAlignment = .left
        date.numberOfLines = 0
        return date
    }()
    
    lazy var thoughts: UILabel = {
        let label = UILabel()
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
        
        addSubview(polaroidFrame)
        polaroidFrame.addSubview(imageI)
        addSubview(picNumber)
        polaroidFrame.addSubview(thoughts)
        
        polaroidFrame.translatesAutoresizingMaskIntoConstraints = false
        imageI.translatesAutoresizingMaskIntoConstraints = false
        picNumber.translatesAutoresizingMaskIntoConstraints = false
        thoughts.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            polaroidFrame.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            polaroidFrame.leadingAnchor.constraint(equalTo: leadingAnchor),
            polaroidFrame.trailingAnchor.constraint(equalTo: trailingAnchor),
            polaroidFrame.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageI.heightAnchor.constraint(equalToConstant: ((ConstraintsManager.height * 0.6) - 30)),
            imageI.topAnchor.constraint(equalTo: polaroidFrame.topAnchor, constant: 20),
            imageI.leadingAnchor.constraint(equalTo: polaroidFrame.leadingAnchor, constant: 12),
            imageI.trailingAnchor.constraint(equalTo: polaroidFrame.trailingAnchor, constant: -12),
            
            picNumber.bottomAnchor.constraint(equalTo: polaroidFrame.bottomAnchor, constant: -12),
            picNumber.trailingAnchor.constraint(equalTo: polaroidFrame.trailingAnchor, constant: -12),
            
            thoughts.topAnchor.constraint(equalTo: imageI.bottomAnchor, constant: 10),
            thoughts.leadingAnchor.constraint(equalTo: polaroidFrame.leadingAnchor, constant: 12),
            thoughts.trailingAnchor.constraint(equalTo: polaroidFrame.trailingAnchor, constant: -12),
            
            
        ])
        
        if DeviceType.isIphone5 {
            
            thoughts.font = UIFont(name: "Nunito-Bold", size: 10)
            
        } else {
            
            thoughts.font = UIFont(name: "Nunito-Bold", size: 14)
            
        }
          
    }
      
}
