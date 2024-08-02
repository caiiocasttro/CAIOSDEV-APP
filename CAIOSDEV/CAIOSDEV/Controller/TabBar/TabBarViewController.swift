//
//  TabBarViewController.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit
/**
 `TabBarViewController` is a custom subclass of `UITabBarController` that enhances the appearance of the tab bar by adding a custom highlight line under the selected tab.

  ## Properties

  - `lineLeadingConstraints`: A variable to hold the leading constraint for the custom highlight line.

  - `line`: A lazy-loaded UIView representing the custom highlight line under the selected tab. It has a background color, corner radius, and clipping properties configured.

  ## Lifecycle

  - `viewDidLoad()`: Overrides the default implementation to call the `configureTabBar()` method during the view controller's load.

  ## Methods

  - `configureTabBar()`: Configures the tab bar appearance by adding the custom highlight line, setting up its constraints, configuring shadow properties, creating view controllers for each tab, setting tab bar item images and titles, and assigning the view controllers to the tab bar.

  - `tabBar(_:didSelect:)`: Overrides the default tab bar delegate method to animate the custom highlight line when a tab is selected. It calculates the width of each tab item and updates the leading constraint of the highlight line accordingly.

  # Example Usage

  ```
  let tabBarController = TabBarViewController()
  navigationController?.pushViewController(tabBarController, animated: true)
 ```
 
 ## Important Notes

 Ensure that the images named "user," "trophy," "motherboard," "book," and "Heart" are available in the asset catalog.
 The custom highlight line assumes that each tab item has an equal distribution of width in the tab bar.
 */
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
