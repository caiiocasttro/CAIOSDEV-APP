//
//  HobbiesViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit
import AVFoundation

class HobbiesViewController: UIViewController {
    
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
    
    lazy var titlePartI: UILabel = {
        let title = UILabel()
        title.text = "My"
        title.textColor = UIColor.white
        title.font = UIFont(name: "Nunito-Black", size: 60)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var titlePartII: UILabel = {
        let title = UILabel()
        title.text = "Passions"
        title.textColor = UIColor.white
        title.font = UIFont(name: "Nunito-Black", size: 60)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.register(HobbiesViewCell.self, forCellReuseIdentifier: HobbiesIdentifier.main.rawValue)
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
    

    //MARK: COnfiguring layout
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
        hobbiesView.addSubview(tableView)
        
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
        
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
            
            titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: hobbiesView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: hobbiesView.heightAnchor),
            
            hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
            hobbiesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hobbiesView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hobbiesView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hobbiesView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            hobbiesView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
            
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
            
            tableView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        
        ])
        
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
extension HobbiesViewController: UIScrollViewDelegate {
    
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
extension HobbiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HobbiesModel.pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HobbiesIdentifier.main.rawValue, for: indexPath) as! HobbiesViewCell
        cell.backgroundColor = UIColor.clear
        cell.image = HobbiesModel.pictures[indexPath.row]
        cell.text = HobbiesModel.thoughts[indexPath.row]
        cell.date = HobbiesModel.dates[indexPath.row]
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    
    
}

