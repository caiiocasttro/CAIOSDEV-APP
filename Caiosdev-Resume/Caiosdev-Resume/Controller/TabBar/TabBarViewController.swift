//
//  TabBarViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //MARK: Objects
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "Orange")
        return line
    }()
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        
    }
    
    //MARK: Configuring tab bar
    private func configureTabBar() {
        
        tabBar.addSubview(line)
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            line.widthAnchor.constraint(equalToConstant: view.bounds.width / 7),
            line.heightAnchor.constraint(equalToConstant: 2),
            line.topAnchor.constraint(equalTo: tabBar.topAnchor),
            line.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 10)
        ])
        
        let AboutMe = AboutMeViewController()
        let CareerGoals = CareerGoalsViewController()
        let Education = EducationViewController()
        let Experience = ExperienceViewController()
        let Hobbies = HobbiesViewController()
        
        self.setViewControllers([AboutMe, CareerGoals, Education, Experience, Hobbies], animated: true)
        self.tabBar.backgroundColor = UIColor.white
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(named: "user")
        items[0].title = "About Me"
        
        items[1].image = UIImage(named: "trophy")
        items[1].title = "Career Goals"
        
        items[2].image = UIImage(named: "motherboard")
        items[2].title = "Education"
        
        items[3].image = UIImage(named: "book")
        items[3].title = "Experience"
        
        items[4].image = UIImage(named: "fire")
        items[4].title = "Hobbies"
        
    }
    
    
}
