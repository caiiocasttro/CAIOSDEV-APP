//
//  LocationViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit
/**
 A custom UITableViewCell class for displaying location information.

 - Note: This class assumes that the cell layout consists of a title, an icon representing the location, and additional text.

 ### Properties:
 - `title`: A string representing the title of the location.
 - `textString`: A string providing additional information about the location.

 ### Objects:
 - `cellTitle`: A UILabel for displaying the title of the cell.
 - `cellView`: A UIView serving as the background for the cell with rounded corners.
 - `iconLocation`: An UIImageView displaying an icon representing the location (assumed to be a map icon).
 - `text`: A UILabel for displaying the location.

 ### Initialization:
 - `init(style:reuseIdentifier:)`: Initializes the cell with the specified style and reuseIdentifier. It also configures the layout using `configureLayout()`.

 ### Layout Configuration:
 - `configureLayout()`: Configures the layout of the cell, adding subviews, setting colors, fonts, and constraints.

 ### Constraints:
 The layout is set up with the following constraints:
 - `cellTitle` is positioned at the top-left of the cell.
 - `cellView` is positioned below `cellTitle`, filling the cell width, and with rounded corners.
 - `iconLocation` is positioned inside `cellView` with a fixed width and height, and a distance from the top and left edges.
 - `text` is positioned to the right of `iconLocation`, centered vertically.

 ### Usage:
 ```
 // Example usage in a UITableViewController
 let locationCell = LocationViewCell(style: .default, reuseIdentifier: "LocationCell")
 locationCell.title = "Eiffel Tower"
 locationCell.textString = "A famous landmark in Paris, France."
 return locationCell
 */
class LocationViewCell: UITableViewCell {
    
    //MARK: Proprieties
    
    /// The title of the cell.
    var title: String? {
        didSet {
            guard let string = title else { return }
            
            cellTitle.text = string
        }
    }
    
    /// Name of the location.
    var textString: String? {
        didSet {
            guard let string = textString else { return }
            
            text.text = string
        }
    }
    
    //MARK: Objects
    
    /// Label for displaying the title of the cell.
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 15)
        title.textAlignment = .left
        return title
    }()
    
    /// View serving as the background for the cell with rounded corners.
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view
    }()
    
    /// ImageView displaying an icon representing the location (assumed to be a map icon).
    lazy var iconLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        return image
    }()
    
    /// Label for displaying name of the location.
    lazy var text: UILabel = {
        let text = UILabel()
        text.textColor = UIColor(named: "BlackSecondary")
        text.font = UIFont(name: "Nunito-SemiBold", size: 12)
        text.numberOfLines = 0
        text.textAlignment = .left
        return text
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configuring layout
    
    /// Configures the layout of the cell, adding subviews, setting colors, fonts, and constraints.
    private func configureLayout() {
        
        backgroundColor = UIColor.clear
        
        let leading = layoutMarginsGuide.leadingAnchor
        
        let trailing = layoutMarginsGuide.trailingAnchor

        addSubview(cellTitle)
        addSubview(cellView)
        cellView.addSubview(iconLocation)
        cellView.addSubview(text)
        
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        iconLocation.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cellTitle.topAnchor.constraint(equalTo: topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leading),
            cellView.trailingAnchor.constraint(equalTo: trailing),
            cellView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            iconLocation.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            iconLocation.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            iconLocation.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            iconLocation.widthAnchor.constraint(equalToConstant: 30),
            iconLocation.heightAnchor.constraint(equalToConstant: 30),
            
            text.leadingAnchor.constraint(equalTo: iconLocation.trailingAnchor, constant: 10),
            text.centerYAnchor.constraint(equalTo: iconLocation.centerYAnchor)
        
        ])
        
        
    }

}
