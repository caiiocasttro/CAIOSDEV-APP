//
//  AboutMeTableViewCell.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit
/**
 `AboutMeTableViewCell` is a custom `UITableViewCell` designed for displaying information with a title and accompanying text. It features a rounded-corner background view with a title label and a multiline text label.

 ## Properties

 - `title`: A string representing the title of the cell. Setting this property updates the `cellTitle` label.
 - `textString`: A string representing the text content of the cell. Setting this property updates the `text` label.

 ## Objects

 - `cellTitle`: A `UILabel` used to display the title of the cell. It is configured with a custom font, text color, and left alignment.
 - `cellView`: A `UIView` serving as the background view for the cell. It has rounded corners and a white background color.
 - `text`: A `UILabel` used to display multiline text content. It is configured with a custom font, text color, and left alignment.

 ## Initialization

 - `init(style:reuseIdentifier:)`: The designated initializer for the cell. It calls `configureLayout()` to set up the cell's layout.

 ## Layout Configuration

 - `configureLayout()`: Configures the layout of the cell, setting up constraints for the `cellTitle`, `cellView`, and `text` components.

 ## Example Usage:

 ```
 // Create an instance of AboutMeTableViewCell
 let cell = AboutMeTableViewCell(style: .default, reuseIdentifier: "AboutMeCell")

 // Set the title and text content
 cell.title = "About Me"
 cell.textString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
 ```
 Note: Make sure to customize font names, sizes, and color names according to your project's design system.
*/
class AboutMeTableViewCell: UITableViewCell {
    
    //MARK: Proprieties
    
    /// A string representing the title of the cell.
    var title: String? {
        didSet {
            guard let string = title else { return }
            
            cellTitle.text = string
        }
    }
    
    /// A string representing the text content of the cell.
    var textString: String? {
        didSet {
            guard let string = textString else { return }
            
            text.text = string
        }
    }
    
    //MARK: Objects
    
    /// A label for displaying the title of the cell.
    lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 15)
        title.textAlignment = .left
        return title
    }()
    
    /// The background view for the cell with rounded corners.
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view
    }()
    
    /// A label for displaying multiline text content.
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
    
    /// Configures the layout of the cell.
    private func configureLayout() {
        
        backgroundColor = UIColor.clear
        
        let leading = layoutMarginsGuide.leadingAnchor
        
        let trailing = layoutMarginsGuide.trailingAnchor
        
        //Adding subviews
        addSubview(cellTitle)
        addSubview(cellView)
        cellView.addSubview(text)
        
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
            
            
            cellTitle.topAnchor.constraint(equalTo: topAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: leading),
        
            cellView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: leading),
            cellView.trailingAnchor.constraint(equalTo: trailing),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            text.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            text.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            text.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            text.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
        
        ])
        
    }
    
}
