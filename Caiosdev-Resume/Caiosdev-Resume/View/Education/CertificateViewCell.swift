//
//  CertificateViewCell.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit

class CertificateViewCell: UITableViewCell {
    
    //MARK: Properties
    var title: String? {
        didSet {
            guard let string = title else { return }
            
            cellTitle.text = string
        }
    }
    
    var name: String? {
        didSet {
            guard let string = name else { return }
            
            certificateTitle.text = string
        }
    }
    
    var dateString: String? {
        didSet {
            guard let string = dateString else { return }
            
            date.text = string
        }
    }
    
    //MARK: Objects
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.text = "My certificates"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.textAlignment = .left
        return title
    }()
    
    lazy var subtitle: UILabel = {
        let title = UILabel()
        title.text = "Let me show you!"
        title.textColor = UIColor(named: "GrayLabels")
        title.font = .systemFont(ofSize: 14, weight: .medium)
        title.textAlignment = .left
        return title
    }()
    
    lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.frame = .init(x: 0, y: 0, width: 40, height: 40)
        icon.image = UIImage(named: "certificate")
        
        return icon
    }()
    
    lazy var certificateTitle: UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.textColor = UIColor(named: "BlackLabels")
        title.font = .systemFont(ofSize: 18, weight: .semibold)
        title.textAlignment = .left
        return title
    }()
    
    lazy var schoolName: UILabel = {
        let title = UILabel()
        title.text = "Udemy"
        title.textColor = UIColor(named: "GrayLabels")
        title.font = .systemFont(ofSize: 14, weight: .medium)
        title.textAlignment = .left
        return title
    }()
    
    lazy var date: UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.textColor = UIColor(named: "GrayLabels")
        title.font = .systemFont(ofSize: 10, weight: .regular)
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
