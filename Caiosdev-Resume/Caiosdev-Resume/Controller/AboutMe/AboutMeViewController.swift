//
//  ViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit
import AVFoundation

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
        button.frame = .init(x: 0, y: 0, width: 100, height: 50)
        button.backgroundColor = .white
        button.setTitle("Hire me", for: .normal)
        button.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
        button.setTitleColor(UIColor(named: "OrangeTitle"), for: .normal)
        button.layer.cornerRadius = button.frame.size.height / 3
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        return button
    }()
    
    lazy var contactButtonII: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 0, y: 0, width: 100, height: 50)
        button.backgroundColor = UIColor(named: "OrangeTitle")
        button.setTitle("Hire me", for: .normal)
        button.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = button.frame.size.height / 3
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
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
        hello.font = UIFont(name: "Nunito-Black", size: 60)
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
            
            hello.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
            
            myName.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: aboutMeView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: aboutMeView.heightAnchor),
            
            aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
            aboutMeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            aboutMeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            aboutMeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            aboutMeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            aboutMeView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
            
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
    
    func contactButtonAnimation() {
        
        if contactButtonII.alpha == 1 {
            self.contactButtonII.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } else {
            self.contactButtonI.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
        
        UIView.animate(withDuration: 0.75) {
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

//MARK: ScrollViewDelegate
extension AboutMeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let contentViewHeight = scrollView.contentSize.height
        let yOffset = scrollView.contentOffset.y
        
        let shouldAnimate: CGFloat = 10
        
        if yOffset + scrollViewHeight + shouldAnimate >= contentViewHeight {
            
            showButtonAnimation()
            buttonShowed = true
            
            if !self.shouldAnimate {
                self.shouldAnimate = true
                tableView.reloadData()

            }
        } else {
            
            if self.buttonShowed {
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



