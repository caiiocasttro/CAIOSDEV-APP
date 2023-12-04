//
//  LaunchScreen.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 25.10.2023.
//

import UIKit
/**
 `LaunchScreen` class is a UIViewController subclass responsible for displaying a launch screen with animations and transitioning to the main screen.

  ## Properties:
  - `avatar`: An IBOutlet connected to an `UIImageView` representing an avatar on the launch screen.
  - `caiosdevLabel`: An IBOutlet connected to a `UILabel` displaying the text "caiosdev" on the launch screen.

  ## Methods:
  - `viewDidLoad()`: Overrides the superclass method and is called after the controller's view is loaded. It configures the appearance and initiates animations.
  - `configureAppearance()`: Configures the initial appearance of UI elements like setting alpha, font, and text color.
  - `avatarAnimation()`: Initiates an animation for the avatar, gradually increasing its alpha and applying a scale transformation.
  - `labelAnimation()`: Initiates an animation for the "caiosdev" label, gradually increasing its alpha, moving it upward, and triggering a segue to the main screen after a delay.

  - Note: The animations are achieved using the `UIView.animate` method.

  ## Usage:
  1. Create an instance of `LaunchScreen` and present it when the application starts.
  2. The launch screen will display the avatar and the "caiosdev" label with specified animations.
  3. After the animations complete, the view controller will automatically segue to the main screen.

  - Important: Ensure that the IBOutlet connections are correctly set in the storyboard or programmatically.

  ## Example:
  ```swift
  let launchScreen = LaunchScreen()
  present(launchScreen, animated: true, completion: nil)
 */
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
