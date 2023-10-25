//
//  LaunchScreen.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 25.10.2023.
//

import UIKit

class LaunchScreen: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var caiosdevLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        avatarAnimation()
        labelAnimation()
    }
    
    //MARK: Configuring appearance
    func configureAppearance() {
        avatar.alpha = 0
        caiosdevLabel.alpha = 0
        caiosdevLabel.font = UIFont(name: "Nunito-Black", size: 25)
        caiosdevLabel.textColor = UIColor(named: "BlackSecondary")
        
    }
    
    //MARK: Animations
    func avatarAnimation() {
        UIView.animate(withDuration: 1.5) {
            self.avatar.alpha = 1
            self.avatar.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func labelAnimation() {
        
        UIView.animate(withDuration: 1.5, delay: 0.75) {
            self.caiosdevLabel.alpha = 1
            self.caiosdevLabel.frame.origin.y -= 40
        } completion: { (completed) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.performSegue(withIdentifier: tabBarSegue.main.rawValue, sender: nil)
            }
        }

        
    }
    
}
