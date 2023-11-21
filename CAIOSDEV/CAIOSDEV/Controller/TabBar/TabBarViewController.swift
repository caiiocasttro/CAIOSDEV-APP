//
//  TabBarViewController.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //MARK: Initializer
    var lineLeadingConstraints: NSLayoutConstraint!
    
    //MARK: Objects
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "OrangeIcon")
        line.layer.cornerRadius = 1
        line.clipsToBounds = true
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
        
        line.widthAnchor.constraint(equalToConstant: view.bounds.width / 7).isActive = true
        line.heightAnchor.constraint(equalToConstant: 2).isActive = true
        line.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        lineLeadingConstraints = line.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor, constant: 10)
        lineLeadingConstraints.isActive = true
        
        tabBar.layer.shadowRadius = 5
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowPath = UIBezierPath(rect: tabBar.bounds).cgPath
        
        let AboutMe = AboutMeViewController()
        let CareerGoals = CareerGoalsViewController()
        let Education = EducationViewController()
        let Experience = ExperienceViewController()
        let Hobbies = PassionsViewController()
        
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
        
        items[4].image = UIImage(named: "Heart")
        items[4].title = "Passions"
        
        
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            
            //Applying animation
            UIView.animate(withDuration: 0.25) {
                
                //The total width of the tabbar
                let tabBarWidth = tabBar.frame.width
                // The width of each tabbar item, assuming an equal distribution of each tab item
                let itemWidth = tabBarWidth / CGFloat(tabBar.items?.count ?? 1)
                
                // Updating the line leading constraints based on the item selected
                self.lineLeadingConstraints.constant = CGFloat(index) * itemWidth + 10
                // This method updates the layout of the view and its subviews immediately if needed.
                self.view.layoutIfNeeded()
            }
            
            
        }
    }
    
    
}
