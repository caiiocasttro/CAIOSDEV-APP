//
//  ExperienceViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit
import AVFoundation

class ExperienceViewController: UIViewController {
    
    //MARK: Initializer
    var player: AVAudioPlayer?
    
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: properties
    var animatedOnce = false
    
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
        button.setTitleColor(UIColor(named: "OrangeTitle"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        return button
    }()
    
    lazy var contactButtonII: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 0, y: 0, width: 100, height: 50)
        button.backgroundColor = UIColor(named: "OrangeTitle")
        button.setTitle("Hire me", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.alpha = 0
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var experienceView: CustomView = {
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
        title.text = "Experience"
        title.textColor = UIColor.white
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Professional Path 👨🏾‍💻"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.register(ExperienceViewCell.self, forCellReuseIdentifier: ExperienceIdentifiers.main.rawValue)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
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
    private func configureLayout() {
        let background = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
        background.image = UIImage(named: "office")
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
        scrollView.addSubview(experienceView)
        experienceView.addSubview(backgroundSheet)
        experienceView.sendSubviewToBack(backgroundSheet)
        experienceView.addSubview(line)
        experienceView.addSubview(titlePage)
        experienceView.addSubview(contactButtonII)
        experienceView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        contactButtonI.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        experienceView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        contactButtonII.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
        
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            

            contactButtonI.topAnchor.constraint(equalTo: view.topAnchor, constant: ((ConstraintsManager.height * 0.1) - 30)),
            contactButtonI.trailingAnchor.constraint(equalTo: trailing),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: experienceView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: experienceView.heightAnchor),
            
            
            experienceView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            experienceView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            experienceView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            experienceView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            line.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: experienceView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 15),
            titlePage.leadingAnchor.constraint(equalTo: leading),
            
            contactButtonII.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 15),
            contactButtonII.trailingAnchor.constraint(equalTo: trailing),
            
            tableView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
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
                
                //Experience View
                experienceView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                experienceView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
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
            
                //Experience View
                experienceView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 10)),
                experienceView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9) - 5),
                
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
            
                //Experience View
                experienceView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 20)),
                experienceView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9)),
                
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
            
                //Experience View
                experienceView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                experienceView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
            ])
            
        }
        
        //Adding button's action
        contactButtonI.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        contactButtonII.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
    }
    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 15
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

//MARK: Scrollview Delegate
extension ExperienceViewController: UIScrollViewDelegate {
    
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

//MARK: TableView Delegate & DataSource
extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyExperienceModel.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceIdentifiers.main.rawValue, for: indexPath) as! ExperienceViewCell
        cell.isUserInteractionEnabled = false
        cell.position = MyExperienceModel(rawValue: MyExperienceModel.companies[indexPath.row])?.position
        cell.location = MyExperienceModel(rawValue: MyExperienceModel.companies[indexPath.row])?.companiesNameLocationDate
        cell.taskI = MyExperienceModel(rawValue: MyExperienceModel.companies[indexPath.row])?.tasks[0]
        cell.taskII = MyExperienceModel(rawValue: MyExperienceModel.companies[indexPath.row])?.tasks[1]
        cell.taskIII = MyExperienceModel(rawValue: MyExperienceModel.companies[indexPath.row])?.tasks[2]
        return cell
    }
    
}
