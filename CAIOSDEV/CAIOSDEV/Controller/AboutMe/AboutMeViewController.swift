//
//  ViewController.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit
import AVFoundation
/**
 The `AboutMeViewController` class is a UIViewController responsible for displaying information about the developer. It includes a variety of UI elements such as labels, buttons, and a UITableView.

 ## Properties
 - `sheet`: An instance of `ContactsSheetViewController` for handling contact sheet presentation.
 - `player`: An AVAudioPlayer instance for playing sound effects.
 - `feedbackGenerator`: A UIImpactFeedbackGenerator for providing haptic feedback.
 - `animatedOnce`: A boolean flag to track whether the initial animation has occurred.
 - `shouldAnimate`: A boolean flag to determine whether table view cells should be animated.
 - `buttonShowed`: A boolean flag indicating whether the contact button has been shown.

 ## UI Elements
 - `filter`: A UIView used as a semi-transparent filter overlay.
 - `contactButtonI`: A UIButton for contact, with different configurations for light and dark appearances.
 - `contactButtonII`: A secondary contact button with initial alpha set to 0 for smooth animation.
 - `scrollView`: A UIScrollView for scrolling content.
 - `aboutMeView`: A CustomView containing various UI elements for displaying information.
 - `line`: A UIView representing a decorative line.
 - `hello`: A UILabel displaying a greeting message.
 - `myName`: A UILabel displaying the developer's name.
 - `titlePage`: A UILabel displaying the title of the page.
 - `cellTitle`: An array of strings representing titles for each section in the table view.
 - `text`: An array of strings containing information for each section in the table view.
 - `tableView`: A UITableView for displaying detailed information.

 ## Lifecycle Methods
 - `viewDidLoad()`: Initializes the view and configures its layout, tab bar appearance, and prepares sound effects.
 - `viewDidAppear(_ animated:)`: Overrides the viewDidAppear method to trigger the initial animation only once.

 ## Methods
 - `configureLayout()`: Configures the layout of UI elements based on the device type.
 - `configureTabBar()`: Configures the appearance of the tab bar.
 - `pullContactView()`: Presents the contact view with animation and sound effects.
 - `helloAnimation()`: Animates the greeting message and name labels.
 - `showButtonAnimation()`: Animates the appearance of the secondary contact button.
 - `hideButtonAnimation()`: Animates the disappearance of the secondary contact button.
 - `contactButtonAnimation()`: Animates the contact buttons with a spring effect.
 - `prepareSoundEffect()`: Prepares the AVAudioPlayer with a sound effect file.
 - `soundClick()`: Plays the sound effect when the contact button is pressed.

 ## Extensions
 - `UIScrollViewDelegate`: Implements scrollViewDidScroll to handle scrolling events.
 - `UITableViewDelegate` and `UITableViewDataSource`: Implements methods for table view configuration and animation.

 */
class AboutMeViewController: UIViewController {
    
    //MARK: Initializer
    private let sheet = ContactsSheetViewController()
    
    private var player: AVAudioPlayer?
    
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: Properties
    var animatedOnce = false
    
    var shouldAnimate = false
    
    var buttonShowed = false
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return filter
    }()
    
    lazy var contactButtonI: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.baseBackgroundColor = UIColor.white
        configuration.title = "Hire me"
        configuration.baseForegroundColor = UIColor(named: "OrangeTitle")
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { text in
            var newText = text
            newText.font = DeviceType.isIphone5 ? UIFont(name: "Nunito-Black", size: 12) : UIFont(name: "Nunito-Black", size: 18)
            return newText
        }
        configuration.cornerStyle = .capsule
        button.configuration = configuration
        return button
    }()
    
    lazy var contactButtonII: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.baseBackgroundColor = UIColor(named: "OrangeTitle")
        configuration.title = "Hire me"
        configuration.baseForegroundColor = UIColor.white
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { text in
            var newText = text
            newText.font = DeviceType.isIphone5 ? UIFont(name: "Nunito-Black", size: 12) : UIFont(name: "Nunito-Black", size: 18)
            return newText
        }
        configuration.cornerStyle = .capsule
        button.configuration = configuration
        button.alpha = 0
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var aboutMeView: CustomView = {
        let view = CustomView()
        return view
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")
        line.layer.cornerRadius = 2.5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var hello: UILabel = {
        let hello = UILabel()
        hello.text = "Hello,"
        hello.textColor = UIColor.white
        hello.textAlignment = .left
        hello.numberOfLines = 0
        hello.alpha = 0
        return hello
    }()
    
    lazy var myName: UILabel = {
        let name = UILabel()
        name.text = "I am Caio!"
        name.textColor = UIColor.white
        name.font = UIFont(name: "Nunito-Black", size: 60)
        name.textAlignment = .left
        name.numberOfLines = 0
        name.alpha = 0
        return name
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "About Me 🤔"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var cellTitle: [String] = ["Who am I?", "What am I looking for?", "What languages do I speak?", "Where do I live?"]
    
    lazy var text: [String] = [AboutMeModel.whoIam, AboutMeModel.lookingFor, AboutMeModel.location]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AboutMeTableViewCell.self, forCellReuseIdentifier: AboutMeIdentifiers.main.rawValue)
        tableView.register(LanguagesViewCell.self, forCellReuseIdentifier: AboutMeIdentifiers.Languages.rawValue)
        tableView.register(LocationViewCell.self, forCellReuseIdentifier: AboutMeIdentifiers.Location.rawValue)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        
        //Tab bar
        configureTabBar()
        
        //Layout
        configureLayout()
        
        //Preparing sound
        prepareSoundEffect()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animatedOnce {
            helloAnimation()
            animatedOnce = true
        }
        
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
        background.image = UIImage(named: "picture")
        background.contentMode = .scaleAspectFill
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
        backgroundSheet.image = UIImage(named: "background")
        
        let leading = view.layoutMarginsGuide.leadingAnchor
        
        let trailing = view.layoutMarginsGuide.trailingAnchor
        
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(hello)
        view.addSubview(myName)
        view.addSubview(scrollView)
        scrollView.addSubview(contactButtonI)
        scrollView.addSubview(aboutMeView)
        aboutMeView.addSubview(backgroundSheet)
        aboutMeView.sendSubviewToBack(backgroundSheet)
        aboutMeView.addSubview(line)
        aboutMeView.addSubview(titlePage)
        aboutMeView.addSubview(contactButtonII)
        aboutMeView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        hello.translatesAutoresizingMaskIntoConstraints = false
        myName.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contactButtonI.translatesAutoresizingMaskIntoConstraints = false
        aboutMeView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        contactButtonII.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Constraints
        NSLayoutConstraint.activate([
            
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: aboutMeView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: aboutMeView.heightAnchor),
            
            
            aboutMeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            aboutMeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            aboutMeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            aboutMeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            contactButtonI.topAnchor.constraint(equalTo: view.topAnchor, constant: ((ConstraintsManager.height * 0.1) - 30)),
            contactButtonI.trailingAnchor.constraint(equalTo: trailing),
            
            line.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: aboutMeView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 15),
            titlePage.leadingAnchor.constraint(equalTo: leading),
            
            contactButtonII.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 15),
            contactButtonII.trailingAnchor.constraint(equalTo: trailing),
            
            tableView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        //MARK: Adpting layout
        
        if DeviceType.isIphone5 {
            
            hello.font = UIFont(name: "Nunito-Black", size: 45)
            myName.font = UIFont(name: "Nunito-Black", size: 45)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 12)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 4
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 18)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 12)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 4
            
            NSLayoutConstraint.activate([
                
                //Contact Button 1st
                contactButtonI.widthAnchor.constraint(equalToConstant: 70),
                contactButtonI.heightAnchor.constraint(equalToConstant: 25),
                
                //Hello & Name text
                hello.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
                
                myName.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: -20),
                
                //Contact Button 2nd
                contactButtonII.widthAnchor.constraint(equalToConstant: 70),
                contactButtonII.heightAnchor.constraint(equalToConstant: 25),
                
                //About Me View
                aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                aboutMeView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
            ])
            
            
        } else if DeviceType.isIphone6or7or8 {
            
            hello.font = UIFont(name: "Nunito-Black", size: 50)
            myName.font = UIFont(name: "Nunito-Black", size: 50)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Hello & Name text
                hello.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6) + 20),
                
                myName.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: -20),
                
                //About Me View
                aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 10)),
                aboutMeView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9) - 5),
                
            ])
            
        } else if DeviceType.isIphone6or7or8Plus {
            
            hello.font = UIFont(name: "Nunito-Black", size: 60)
            myName.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Hello & Name text
                hello.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6) + 20),
                
                myName.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: -20),
                
                //About Me View
                aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 20)),
                aboutMeView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9)),
                
            ])
            
        } else if DeviceType.isIphoneXorLater {
            
            hello.font = UIFont(name: "Nunito-Black", size: 60)
            myName.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Hello & Name text
                hello.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
                
                myName.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: -20),
                
                //About Me View
                aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                aboutMeView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
            ])
            
        } else if DeviceType.isIphoneXsMaxorLater {
            
            hello.font = UIFont(name: "Nunito-Black", size: 60)
            myName.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Hello & Name text
                hello.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.7) - 40),
                
                myName.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: -20),
                
                //About Me View
                aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) - 20)),
                aboutMeView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
            ])
            
        }
        
        //Adding button's action
        contactButtonI.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        contactButtonII.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        
        
        
        
    }
    
    
    
    //MARK: Configuring tab button
    private func configureTabBar() {
        
        UIView.animate(withDuration: 0.2) {
            guard let item = self.tabBarController?.tabBar else { return }
            
            item.tintColor = UIColor(named: "OrangeIcon")
            item.unselectedItemTintColor = UIColor(named: "BlackLabels")
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
        }
        
        soundClick()
        contactButtonAnimation()
        feedbackGenerator.impactOccurred()
        UIView.animate(withDuration: 0.25, delay: 0.5) {
            self.present(vc, animated: true)
        }
        
        
    }
    
    //MARK: Animations
    func helloAnimation() {
        
        UIView.animate(withDuration: 0.75) {
            self.hello.alpha = 1
            self.hello.frame.origin.x += 15
        } completion: { done in
            UIView.animate(withDuration: 1.0) {
                self.myName.alpha = 1
                self.myName.frame.origin.x += 15
                self.hello.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
                self.myName.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
            }
        }
    }
    
    func showButtonAnimation() {
        UIView.animate(withDuration: 1.0) {
            self.contactButtonI.alpha = 0
            self.contactButtonII.alpha = 1
            
        }
    }
    
    func hideButtonAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.contactButtonI.alpha = 1
            self.contactButtonII.alpha = 0
        }
    }
    
    func contactButtonAnimation() {
        
        if contactButtonII.alpha == 1 {
                    self.contactButtonII.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                } else {
                    self.contactButtonI.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }
                
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: [.curveLinear]) {
                    self.contactButtonI.transform = .identity
                    self.contactButtonII.transform = .identity
                }
    }
    
    //MARK: Sound effects
    private func prepareSoundEffect() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: ".wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.3
            player?.prepareToPlay()
        } catch {
            print("Error trying to prepare sound click \(error.localizedDescription)")
        }
    }
    
    private func soundClick() {
        
        if let player = player {
            if player.isPlaying {
                player.currentTime = 0
            } else {
                player.play()
            }
        }
        
    }
    
}

//MARK: ScrollViewDelegate
extension AboutMeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let contentViewHeight = scrollView.contentSize.height
        let yOffset = scrollView.contentOffset.y
        
        let shouldAnimate: CGFloat = 10
        
        if yOffset + scrollViewHeight + shouldAnimate >= contentViewHeight {
            
            if scrollView == self.scrollView {
                showButtonAnimation()
                buttonShowed = true
            }
            
            
            if !self.shouldAnimate {
                self.shouldAnimate = true
                tableView.reloadData()
                
            }
        } else {
            
            if self.buttonShowed && scrollView == self.scrollView {
                hideButtonAnimation()
            }
        }
    }
}


//MARK: TableView Delegate & DataSource
extension AboutMeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutMeIdentifiers.Languages.rawValue, for: indexPath) as! LanguagesViewCell
            cell.title = cellTitle[2]
            cell.isUserInteractionEnabled = false
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutMeIdentifiers.Location.rawValue, for: indexPath) as! LocationViewCell
            cell.title = cellTitle[3]
            cell.textString = text[2]
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutMeIdentifiers.main.rawValue, for: indexPath) as! AboutMeTableViewCell
            cell.title = cellTitle[indexPath.row]
            cell.textString = text[indexPath.row]
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let customCell = cell as? LanguagesViewCell {
            
            if shouldAnimate {
                customCell.portugueseLevelFrame = 0
                
                UIView.animate(withDuration: 1.5, delay: 0.5, options: .curveEaseIn) {
                    customCell.portugueseLevelFrame = (ConstraintsManager.width * 0.8) - 19
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    customCell.englishLevelFrame = 0
                    UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn) {
                        customCell.englishLevelFrame = (ConstraintsManager.width * 0.7)
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    customCell.frenchLevelFrame = 0
                    UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn) {
                        customCell.frenchLevelFrame = ((ConstraintsManager.width * 0.2) - 30)
                    }
                }
            }
        }
    }
}



