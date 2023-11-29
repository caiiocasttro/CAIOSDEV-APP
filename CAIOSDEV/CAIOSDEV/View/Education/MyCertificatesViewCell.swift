//
//  MyCertificatesViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 19.10.2023.
//

import UIKit
/**
 `MyCertificatesViewCell` is a custom `UITableViewCell` designed to display a cell with an icon image and a title. It is specifically created for showcasing certificates in a table view.

  ## Properties:
  - `cellView`: A UIView representing the main container for the cell's content.
  - `iconImage`: An UIImageView for displaying the certificate icon.
  - `cellTitle`: A UILabel for displaying the title of the certificate.

  ## Initialization:
  - `init(style:reuseIdentifier:)`: Initializes the cell with a specified style and reuseIdentifier. Calls the `configureLayout()` method to set up the initial layout.
  - `init?(coder:)`: Not implemented to ensure the cell is not created from storyboard or xib.

  ## Layout Configuration:
  - `configureLayout()`: Sets up the layout of the cell, adding subviews and applying constraints.
     - Configures the background color to be clear.
     - Adds `cellView` to the cell and `iconImage` and `cellTitle` to `cellView`.
     - Applies constraints to ensure proper positioning and sizing of the subviews.
     - Adjusts layout based on the device type using the `DeviceType` enum.

  ### Adaptative Layout:
  The cell adapts its layout based on the device type, specifically handling the iPhone 5 screen size.
  - If the device is iPhone 5 (`DeviceType.isIphone5`), the font size of `cellTitle` is set to 18, and the size of `iconImage` is reduced to 35x35.
  - For other device types, the font size of `cellTitle` is set to 20, and the size of `iconImage` is kept at 40x40.

  ## Example Usage:
  ```
  let cell = MyCertificatesViewCell(style: .default, reuseIdentifier: "CertificateCell")
  cell.cellTitle.text = "My Achievements"
  // Set up additional properties as needed
 ```
 Note: Ensure to set the DeviceType enum appropriately based on the actual implementation in the project.
 */
class MyCertificatesViewCell: UITableViewCell {
    
    //MARK: Objects
    lazy var cellView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.frame = .init(x: 0, y: 0, width: 40, height: 40)
        iconImage.image = UIImage(named: "certificate")
        return iconImage
    }()
    
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.text = "My certificates"
        title.textColor = UIColor(named: "BlackSecondary")
        title.textAlignment = .left
        return title
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
        
        let leading = layoutMarginsGuide.leadingAnchor
        
        addSubview(cellView)
        cellView.addSubview(iconImage)
        cellView.addSubview(cellTitle)
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cellView.widthAnchor.constraint(equalTo: widthAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            iconImage.leadingAnchor.constraint(equalTo: leading),
            iconImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            
            cellTitle.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            cellTitle.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor)
        
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            cellTitle.font = UIFont(name: "Nunito-Black", size: 18)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 35),
                iconImage.heightAnchor.constraint(equalToConstant: 35)
                
            ])
            
        } else {
            
            cellTitle.font = UIFont(name: "Nunito-Black", size: 20)
            
            NSLayoutConstraint.activate([
            
                iconImage.widthAnchor.constraint(equalToConstant: 40),
                iconImage.heightAnchor.constraint(equalToConstant: 40)
                
            ])
        }
    }

}
