//
//  EducationViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit

class EducationViewCell: UITableViewCell {
    
    var schoolName: String? {
        didSet {
            guard let string = schoolName else { return }
            
            school.text = string
        }
    }
    
    var graduateCertificateName: String? {
        didSet {
            guard let string = graduateCertificateName else { return }
            
            graduateDescription.text = string
        }
    }
    
    
    //MARK: Objects
    lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.frame = .init(x: 0, y: 0, width: 40, height: 40)
        icon.image = UIImage(named: "education")
        
        return icon
    }()
    
    lazy var school: UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.textColor = UIColor(named: "BlackLabels")
        title.font = .systemFont(ofSize: 18, weight: .semibold)
        title.textAlignment = .left
        return title
    }()
    
    lazy var graduate: UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.textColor = UIColor(named: "GrayLabels")
        title.font = .systemFont(ofSize: 12, weight: .regular)
        title.textAlignment = .left
        return title
    }()
    
    lazy var graduateDescription: UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.textColor = UIColor(named: "GrayLabels")
        title.font = .systemFont(ofSize: 12, weight: .semibold)
        title.textAlignment = .left
        return title
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
