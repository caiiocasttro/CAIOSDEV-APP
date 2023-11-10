//
//  EducationViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import SafariServices
import UIKit
import AVFoundation

class EducationViewController: UIViewController {
    
    //MARK: Initializer
    var player: AVAudioPlayer?
    
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: Properties
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
    
    lazy var educationView: CustomView = {
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
        title.text = "Education"
        title.textColor = UIColor.white
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Scroll up to discover 📚"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EducationViewCell.self, forCellReuseIdentifier: EducationIdentifiers.education.rawValue)
        tableView.register(MyCertificatesViewCell.self, forCellReuseIdentifier: EducationIdentifiers.title.rawValue)
        tableView.register(CertificateViewCell.self, forCellReuseIdentifier: EducationIdentifiers.certificate.rawValue)
        tableView.register(SkillsViewCell.self, forCellReuseIdentifier: EducationIdentifiers.skills.rawValue )
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
        background.image = UIImage(named: "setup")
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
        scrollView.addSubview(educationView)
        educationView.addSubview(backgroundSheet)
        educationView.sendSubviewToBack(backgroundSheet)
        educationView.addSubview(line)
        educationView.addSubview(titlePage)
        educationView.addSubview(contactButtonII)
        educationView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        contactButtonI.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        educationView.translatesAutoresizingMaskIntoConstraints = false
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
            
            backgroundSheet.widthAnchor.constraint(equalTo: educationView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: educationView.heightAnchor),
            
            
            educationView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            educationView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            educationView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            educationView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            line.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: educationView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 15),
            titlePage.leadingAnchor.constraint(equalTo: leading),
            
            contactButtonII.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 15),
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
                
                //Education View
                educationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                educationView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
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
            
                //Education View
                educationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 10)),
                educationView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9) - 5),
                
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
            
                //Education View
                educationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 20)),
                educationView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9)),
                
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
            
                //Education View
                educationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                educationView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
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
            
                //Education View
                educationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) - 20)),
                educationView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
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
    
    func certificateView(view: UIViewController) {
        navigationController?.present(view, animated: true)
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

//MARK: TableView Delegate & DataSource
extension EducationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row <= 9 {
            return 80
        } else {
            return 640
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row <= 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EducationIdentifiers.education.rawValue, for: indexPath) as! EducationViewCell
            cell.isUserInteractionEnabled = false
            cell.school = MyEducationModel.school[indexPath.row]
            cell.graduatedString = MyEducationModel(rawValue: MyEducationModel.school[indexPath.row])?.graduation
            cell.graduateInfo = MyEducationModel(rawValue: MyEducationModel.school[indexPath.row])?.description
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EducationIdentifiers.title.rawValue, for: indexPath) as! MyCertificatesViewCell
            cell.isUserInteractionEnabled = false
            return cell
        } else if indexPath.row == 10 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EducationIdentifiers.skills.rawValue, for: indexPath) as!
            SkillsViewCell
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EducationIdentifiers.certificate.rawValue, for: indexPath) as!
            CertificateViewCell
            if indexPath.row == 4 {
                cell.certificate = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[0])?.rawValue
                cell.school = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[0])?.school
                cell.dateString = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[0])?.dates
            } else if indexPath.row == 5 {
                cell.certificate = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[1])?.rawValue
                cell.school = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[1])?.school
                cell.dateString = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[1])?.dates
            } else if indexPath.row == 6 {
                cell.certificate = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[2])?.rawValue
                cell.school = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[2])?.school
                cell.dateString = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[2])?.dates
            } else if indexPath.row == 7 {
                cell.certificate = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[3])?.rawValue
                cell.school = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[3])?.school
                cell.dateString = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[3])?.dates
            } else if indexPath.row == 8 {
                cell.certificate = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[4])?.rawValue
                cell.school = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[4])?.school
                cell.dateString = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[4])?.dates
            } else {
                cell.certificate = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[5])?.rawValue
                cell.school = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[5])?.school
                cell.dateString = MyCertificateModel(rawValue: MyCertificateModel.cetificateName[5])?.dates
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 4 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel(rawValue: MyCertificateModel.cetificateName[0])?.linkURL ?? "google.com") else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 5 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel(rawValue: MyCertificateModel.cetificateName[1])?.linkURL ?? "google.com") else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 6 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel(rawValue: MyCertificateModel.cetificateName[2])?.linkURL ?? "google.com") else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 7 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel(rawValue: MyCertificateModel.cetificateName[3])?.linkURL ?? "google.com") else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 8 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel(rawValue: MyCertificateModel.cetificateName[4])?.linkURL ?? "google.com") else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel(rawValue: MyCertificateModel.cetificateName[5])?.linkURL ?? "google.com") else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        }
    }
}

//MARK: Scrollview Delegate
extension EducationViewController: UIScrollViewDelegate {
    
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
