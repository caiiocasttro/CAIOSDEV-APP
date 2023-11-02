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
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return filter
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 0, y: 0, width: 75, height: 25)
        button.setBackgroundImage(UIImage(named: "HireMe"), for: .normal)
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
        title.font = UIFont(name: "Nunito-Black", size: 60)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var titlePartII: UILabel = {
        let title = UILabel()
        title.text = "Education"
        title.textColor = UIColor.white
        title.font = UIFont(name: "Nunito-Black", size: 60)
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
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(titlePartI)
        view.addSubview(titlePartII)
        view.addSubview(scrollView)
        scrollView.addSubview(educationView)
        educationView.addSubview(backgroundSheet)
        educationView.sendSubviewToBack(backgroundSheet)
        educationView.addSubview(line)
        educationView.addSubview(titlePage)
        educationView.addSubview(contactButton)
        educationView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        educationView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
            
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
            
            titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
            
            contactButton.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 15),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: educationView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: educationView.heightAnchor),
            
            educationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
            educationView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            educationView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            educationView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            educationView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            educationView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 20),
            
            line.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: educationView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: educationView.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
        
        //Adding button's action
        contactButton.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        
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
        self.contactButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.75) {
            self.contactButton.transform = .identity
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
            return 600
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
            cell.graduateInfo = MyEducationModel.description[indexPath.row]
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
                cell.certificate = MyCertificateModel.cetificateName[0]
                cell.dateString = MyCertificateModel.date[0]
            } else if indexPath.row == 5 {
                cell.certificate = MyCertificateModel.cetificateName[1]
                cell.dateString = MyCertificateModel.date[1]
            } else if indexPath.row == 6 {
                cell.certificate = MyCertificateModel.cetificateName[2]
                cell.dateString = MyCertificateModel.date[2]
            } else if indexPath.row == 7 {
                cell.certificate = MyCertificateModel.cetificateName[3]
                cell.dateString = MyCertificateModel.date[3]
            } else if indexPath.row == 8 {
                cell.certificate = MyCertificateModel.cetificateName[4]
                cell.dateString = MyCertificateModel.date[4]
            } else {
                cell.certificate = MyCertificateModel.cetificateName[5]
                cell.dateString = MyCertificateModel.date[5]
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 4 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel.LevelUpSwift) else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 5 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel.iOSAutoLayoutURL) else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 6 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel.iOSAnimationURL) else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 7 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel.iOSDevelopmentURL) else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else if indexPath.row == 8 {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel.userExperience) else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        } else {
            feedbackGenerator.impactOccurred()
            guard let url = URL(string: MyCertificateModel.webAndMobileURL) else { return }
            
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .pageSheet
            self.present(vc, animated: true)
        }
    }
}
