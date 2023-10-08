//
//  ViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return filter
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "Orange")
        return line
    }()


    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        configureLayout()
    }


    //MARK: Configuring tab button
    private func configureTabBar() {
        
        self.tabBarItem.title = "About Me"
        
        guard let item = self.tabBarController?.tabBar else { return }
        
        item.tintColor = UIColor(named: "Orange")
        item.unselectedItemTintColor = UIColor(named: "Black")
        
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        //Configuring background
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "picture")
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
//        view.addSubview(line)

        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
//        line.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Constraints
        NSLayoutConstraint.activate([
        
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
//            line.widthAnchor.constraint(equalToConstant: view.bounds.width / 7),
//            line.heightAnchor.constraint(equalToConstant: 2),
//            line.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),
//            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        
        ])
    }
    
}

