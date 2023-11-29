//
//  EducationViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 11.10.2023.
//

import UIKit
/**
 `EducationViewCell` is a custom `UITableViewCell` designed to display education-related information in a timeline-like format.

  ## Properties

  - `school: String?`: Represents the name of the educational institution. Setting this property updates the `schoolName` label.

  - `graduatedString: String?`: Represents a string indicating the graduation status or degree obtained. Setting this property updates the `graduateName` label.

  - `graduateInfo: String?`: Represents additional information about the graduation. Setting this property updates the `graduateDescription` label.

  ## UI Elements

  - `cellView: UIView`: The main view container for the cell, holding all other UI elements.

  - `schoolName: UILabel`: A label displaying the name of the educational institution.

  - `dotImage: UIImageView`: An image view representing a dot in the timeline.

  - `graduateName: UILabel`: A label displaying the graduation status or degree obtained.

  - `dotImageII: UIImageView`: Another timeline dot.

  - `graduateDescription: UILabel`: A label displaying additional information about the graduation.

  ## Initialization

  - `init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)`: Initializes the cell with a given style and reuseIdentifier. Calls `configureLayout()` to set up the initial layout.

  - `required init?(coder: NSCoder)`: Not implemented, raises a fatal error if used. Use `init(style:reuseIdentifier:)` instead.

  ## Layout Configuration

  - `configureLayout()`: Configures the layout of the cell by adding subviews, setting up constraints, and adjusting fonts based on the device type.

  ## Usage

  To use this cell in a `UITableView`, instantiate an object of `EducationViewCell` and set its properties to populate the UI elements. Then, add the cell to the table view.

  ```
  let cell = EducationViewCell(style: .default, reuseIdentifier: "educationCell")
  cell.school = "University of Example"
  cell.graduatedString = "Graduated with Honors"
  cell.graduateInfo = "Bachelor of Example"
  tableView.dequeueReusableCell(withIdentifier: "educationCell", for: indexPath)
 ```
 
 Note: Ensure that the required image assets, such as "education," "dot," etc., are present in the project.
 
 ## Adaptative Layout

 The layout is adjusted based on the device type. For iPhone 5, font sizes and icon dimensions are set to smaller values.

 DeviceType.isIphone5: Checks if the device is an iPhone 5.
 Font sizes and icon dimensions are adjusted accordingly.

 */
class EducationViewCell: UITableViewCell {
    
    //MARK: Proprieties
    var school: String? {
        didSet {
            guard let string = school else { return }
            schoolName.text = string
        }
    }
    
    var graduatedString: String? {
        didSet {
            guard let string = graduatedString else { return }
            graduateName.text = string
        }
    }
    
    var graduateInfo: String? {
        didSet {
            guard let string = graduateInfo else { return }
            graduateDescription.text = string
        }
    }
  
    //MARK: Objects
    lazy var cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var schoolName: UILabel = {
        let school = UILabel()
        school.textColor = UIColor(named: "BlackLabels")
        school.textAlignment = .left
        return school
    }()
    
    lazy var dotImage: UIImageView = {
        let dotImage = UIImageView()
        dotImage.frame = .init(x: 0, y: 0, width: 5, height: 5)
        dotImage.image = UIImage(named: "dot")
        return dotImage
    }()
    
    lazy var graduateName: UILabel = {
        let graduate = UILabel()
        graduate.textColor = UIColor(named: "GrayLabels")
        graduate.textAlignment = .left
        return graduate
    }()
    
    lazy var dotImageII: UIImageView = {
        let dotImageII = UIImageView()
        dotImageII.frame = .init(x: 0, y: 0, width: 5, height: 5)
        dotImageII.image = UIImage(named: "dot")
        return dotImageII
    }()
    
    lazy var graduateDescription: UILabel = {
        let graduateDescription = UILabel()
        graduateDescription.textColor = UIColor(named: "GrayLabels")
        graduateDescription.textAlignment = .left
        graduateDescription.numberOfLines = 0
        return graduateDescription
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
        cellView.addSubview(schoolName)
        cellView.addSubview(dotImage)
        cellView.addSubview(graduateName)
        cellView.addSubview(dotImageII)
        cellView.addSubview(graduateDescription)

        cellView.translatesAutoresizingMaskIntoConstraints = false
        schoolName.translatesAutoresizingMaskIntoConstraints = false
        dotImage.translatesAutoresizingMaskIntoConstraints = false
        graduateName.translatesAutoresizingMaskIntoConstraints = false
        dotImageII.translatesAutoresizingMaskIntoConstraints = false
        graduateDescription.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            cellView.widthAnchor.constraint(equalTo: widthAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            
            schoolName.topAnchor.constraint(equalTo: topAnchor),
            schoolName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            dotImage.topAnchor.constraint(equalTo: schoolName.bottomAnchor, constant: 10),
            dotImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            graduateName.centerYAnchor.constraint(equalTo: dotImage.centerYAnchor),
            graduateName.leadingAnchor.constraint(equalTo: dotImage.trailingAnchor, constant: 5),
            
            dotImageII.topAnchor.constraint(equalTo: dotImage.bottomAnchor, constant: 10),
            dotImageII.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            graduateDescription.topAnchor.constraint(equalTo: graduateName.bottomAnchor, constant: -1),
            graduateDescription.leadingAnchor.constraint(equalTo: dotImageII.trailingAnchor, constant: 5),
            graduateDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            schoolName.font = UIFont(name: "Nunito-Bold", size: 16)
            
            graduateName.font = UIFont(name: "Nunito-SemiBold", size: 10)
            
            graduateDescription.font = UIFont(name: "Nunito-SemiBold", size: 10)
            
        } else {
            
            schoolName.font = UIFont(name: "Nunito-Bold", size: 18)
            
            graduateName.font = UIFont(name: "Nunito-SemiBold", size: 12)
            
            graduateDescription.font = UIFont(name: "Nunito-SemiBold", size: 12)
            
        }
        
    }
    
}
