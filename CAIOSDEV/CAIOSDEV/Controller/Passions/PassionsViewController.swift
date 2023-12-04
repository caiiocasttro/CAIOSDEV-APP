//
//  PassionsViewController.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit
import AVFoundation
/**
 The `PassionsViewController` class is a Swift view controller that manages the UI for displaying a collection of passions, each represented by an image and accompanying text. This view controller is part of an iOS application and includes various UI elements, animations, and interactions.
 
 ## Properties

 - player: AVAudioPlayer?
 - Description: An instance of AVAudioPlayer for playing sound effects.
 - Usage: Used to play a sound effect when a button is tapped.
 - feedbackGenerator: UIImpactFeedbackGenerator
 - Description: An instance of UIImpactFeedbackGenerator for providing haptic feedback.
 - Usage: Used to generate haptic feedback when a button is tapped.
 - collectionView: UICollectionView!
 - Description: A collection view for displaying a grid of passion items.
 - Usage: Used to present the collection of passions with images and text.
 - animatedOnce: Bool
 - Description: A boolean flag to track whether the title animation has been performed.
 - Usage: Used to ensure that the title animation is only executed once.
 - buttonShowed: Bool
 - Description: A boolean flag to track whether the contact button is currently visible.
 - Usage: Used to manage the appearance and disappearance animations of the contact button.
 
 ## UI Elements

 - filter: UIView
 - Description: A semi-transparent filter view to overlay on the background.
 - Usage: Enhances the visual appearance of the background image.
 - titlePartI: UILabel and titlePartII: UILabel
 - Description: UILabels for displaying the title in two parts.
 - Usage: Part of the title animation.
 - contactButtonI: UIButton and contactButtonII: UIButton
 - Description: Two contact buttons with different styles.
 - Usage: Buttons to trigger the presentation of a contact view.
 - scrollView: UIScrollView
 - Description: A scroll view containing the collection view and other UI elements.
 - Usage: Enables scrolling through the content.
 - hobbiesView: CustomView
 - Description: A custom view containing the background image, title, line, and buttons.
 - Usage: Provides a container for organizing and presenting UI elements.
 - line: UIView
 - Description: A horizontal line view with rounded corners.
 - Usage: Separates the title and the collection view.
 - titlePage: UILabel
 - Description: A UILabel displaying the title of the page.
 - Usage: Identifies the content as different versions of the user.
 
 ## Lifecycle Methods

 - viewDidLoad()
 - Description: Overrides the superclass method to perform additional setup after loading the view.
 - Usage: Configures the collection view, layout, and prepares the sound effect.
 - viewDidAppear(_ animated: Bool)
 - Description: Overrides the superclass method to perform actions after the view has appeared.
 - Usage: Triggers the title animation if it hasn't been performed before.
 
 ## Layout and Constraints

 - collectionViewLayout() -> UICollectionViewCompositionalLayout
 - Description: Configures the layout for the collection view using compositional layout.
 - Usage: Defines the layout of items, groups, and sections in the collection view.
 - configureLayout()
 - Description: Sets up the constraints and layout for various UI elements based on the device type.
 - Usage: Ensures proper positioning and sizing of UI elements for different screen sizes.
 
 ## Interaction Methods

 - pullContactView()
 - Description: Presents a contact view with animation and sound effect.
 - Usage: Called when the contact button is tapped.
 
 ## Animation Methods

 - titleAnimation()
 - Description: Animates the appearance of the title in two parts.
 - Usage: Creates a visually appealing title animation.
 - contactButtonAnimation()
 - Description: Animates the contact buttons with a scale effect.
 - Usage: Enhances the visual feedback when the contact button is tapped.
 - showButtonAnimation() and hideButtonAnimation()
 - Description: Animates the appearance and disappearance of the contact buttons.
 - Usage: Controls the visibility of the contact buttons based on scrolling.
 
 ## Sound Effects

 - prepareSoundEffect() and soundClick()
 - Description: Prepares and plays a sound effect when the contact button is tapped.
 - Usage: Adds an auditory element to the user interaction.
 
 ## UIScrollViewDelegate Methods

 - scrollViewDidScroll(_ scrollView: UIScrollView)
 - Description: Responds to scrolling events in the main scroll view.
 - Usage: Manages the appearance and disappearance of the contact buttons based on scrolling.
 
 ## UICollectionViewDelegateFlowLayout & UICollectionViewDataSource Methods

 - collectionView(_:numberOfItemsInSection:) and collectionView(_:cellForItemAt:)
 - Description: Implementations for the collection view data source methods.
 - Usage: Populate the collection view with data.
 
 ## Note

 This documentation provides an overview of the PassionsViewController class, its properties, methods, and their usages. It highlights the key features and functionalities of the code for better understanding and maintenance.
 */
class PassionsViewController: UIViewController {
    
    //MARK: Initializer
    var player: AVAudioPlayer?
    
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    var collectionView: UICollectionView!
    
    //MARK: properties
    var animatedOnce = false
    
    var buttonShowed = false
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return filter
    }()
    
    lazy var titlePartI: UILabel = {
        let title = UILabel()
        title.text = "My"
        title.textColor = UIColor.white
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var titlePartII: UILabel = {
        let title = UILabel()
        title.text = "Passions"
        title.textColor = UIColor.white
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var hobbiesView: CustomView = {
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
    
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Versions of me 😄"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        //CollectionView
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
        
        self.collectionView.register(PassionsViewCell.self, forCellWithReuseIdentifier: PassionsIdentifier.main.rawValue)
        
        self.collectionView.backgroundColor = UIColor.clear
        
        self.collectionView.allowsSelection = true
        
        hobbiesView.addSubview(self.collectionView)
        
        //Layout
        configureLayout()
        
        //Preparing sound
        prepareSoundEffect()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animatedOnce {
            titleAnimation()
            animatedOnce = true
        }
        
    }
    
    
    //MARK: Configuring layout
    private func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        //Item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        //Group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.90), heightDimension: .fractionalHeight(1)), subitems: [item])
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 5
        
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    
    
    private func configureLayout() {
        let background = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
        background.image = UIImage(named: "passions")
        background.contentMode = .scaleAspectFill
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
        backgroundSheet.image = UIImage(named: "background")
        
        let leading = view.layoutMarginsGuide.leadingAnchor
        let trailing = view.layoutMarginsGuide.trailingAnchor
        
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(titlePartI)
        view.addSubview(titlePartII)
        view.addSubview(scrollView)
        scrollView.addSubview(contactButtonI)
        scrollView.addSubview(hobbiesView)
        hobbiesView.addSubview(backgroundSheet)
        hobbiesView.sendSubviewToBack(backgroundSheet)
        hobbiesView.addSubview(line)
        hobbiesView.addSubview(titlePage)
        hobbiesView.addSubview(contactButtonII)
        
        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        contactButtonI.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        hobbiesView.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        contactButtonII.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
            
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: hobbiesView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: hobbiesView.heightAnchor),
            
            
            hobbiesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hobbiesView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hobbiesView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hobbiesView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            contactButtonI.topAnchor.constraint(equalTo: view.topAnchor, constant: ((ConstraintsManager.height * 0.1) - 30)),
            contactButtonI.trailingAnchor.constraint(equalTo: trailing),
            
            line.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 15),
            titlePage.leadingAnchor.constraint(equalTo: leading),
            
            contactButtonII.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 15),
            contactButtonII.trailingAnchor.constraint(equalTo: trailing),
            
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 45)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 45)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 12)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 4
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 18)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 12)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 4
            
            NSLayoutConstraint.activate([
                
                //Contact Button 1st
                contactButtonI.widthAnchor.constraint(equalToConstant: 70),
                contactButtonI.heightAnchor.constraint(equalToConstant: 25),
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Contact Button 2nd
                contactButtonII.widthAnchor.constraint(equalToConstant: 70),
                contactButtonII.heightAnchor.constraint(equalToConstant: 25),
                
                //Hobbies View
                hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                hobbiesView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
                //CollectionView
                collectionView.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
                collectionView.widthAnchor.constraint(equalToConstant: ConstraintsManager.width),
                collectionView.heightAnchor.constraint(equalToConstant: ((ConstraintsManager.height * 0.7) + 30)),
                collectionView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 10),
            ])
            
        } else if DeviceType.isIphone6or7or8 {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 50)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 50)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6) + 20),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Hobbies View
                hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 10)),
                hobbiesView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9) - 5),
                
                //CollectionView
                collectionView.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
                collectionView.widthAnchor.constraint(equalToConstant: ConstraintsManager.width),
                collectionView.heightAnchor.constraint(equalToConstant: ((ConstraintsManager.height * 0.7) + 20)),
                collectionView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
                
            ])
            
        } else if DeviceType.isIphone6or7or8Plus {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 60)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6) + 20),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Hobbies View
                hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 20)),
                hobbiesView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9)),
                
                //CollectionView
                collectionView.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
                collectionView.widthAnchor.constraint(equalToConstant: ConstraintsManager.width),
                collectionView.heightAnchor.constraint(equalToConstant: ((ConstraintsManager.height * 0.7) + 20)),
                collectionView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
                
            ])
            
        } else if DeviceType.isIphoneXorLater {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 60)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Hobbies View
                hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                hobbiesView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
                //CollectionView
                collectionView.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
                collectionView.widthAnchor.constraint(equalToConstant: ConstraintsManager.width),
                collectionView.heightAnchor.constraint(equalToConstant: ((ConstraintsManager.height * 0.7) + 30)),
                collectionView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
                
            ])
            
        } else if DeviceType.isIphoneXsMaxorLater {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 60)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.7) - 40),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Hobbies View
                hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) - 20)),
                hobbiesView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
                //CollectionView
                collectionView.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
                collectionView.widthAnchor.constraint(equalToConstant: ConstraintsManager.width),
                collectionView.heightAnchor.constraint(equalToConstant: ((ConstraintsManager.height * 0.7) + 30)),
                collectionView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
                
            ])
            
        }
        
        //Adding target to contact button
        contactButtonI.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        contactButtonII.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
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
        UIView.animate(withDuration: 0.75, delay: 1.0) {
            self.present(vc, animated: true)
        }
    }
    
    //MARK: Animations
    func titleAnimation() {
        
        UIView.animate(withDuration: 0.75) {
            self.titlePartI.alpha = 1
            self.titlePartI.frame.origin.x += 20
        } completion: { (done) in
            UIView.animate(withDuration: 1.0) {
                self.titlePartII.alpha = 1
                self.titlePartII.frame.origin.x += 20
                self.titlePartI.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
                self.titlePartII.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            }
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

//MARK: Scrollview Delegate
extension PassionsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == self.scrollView {
            let scrollViewHeigt = scrollView.frame.size.height
            let contentViewHeigt = scrollView.contentSize.height
            let yOffset = scrollView.contentOffset.y
            
            let shouldAnimate: CGFloat = 10
            
            if yOffset + scrollViewHeigt + shouldAnimate >= contentViewHeigt {
                
                showButtonAnimation()
                buttonShowed = true
                
            } else {
                
                if self.buttonShowed {
                    hideButtonAnimation()
                }
                
            }
        }
        
    }
    
}

//MARK: CollectionView Delegate & DataSource
extension PassionsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PassionsModel.pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PassionsIdentifier.main.rawValue, for: indexPath) as! PassionsViewCell
        cell.backgroundColor = UIColor.clear
        cell.image = PassionsModel(rawValue: PassionsModel.pictures[indexPath.row])?.rawValue
        cell.text = PassionsModel(rawValue: PassionsModel.pictures[indexPath.row])?.phrase
        cell.number = PassionsModel(rawValue: PassionsModel.pictures[indexPath.row])?.picNumber
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    
}
