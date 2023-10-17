//
//  ContactsSheetViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 09.10.2023.
//

import UIKit

protocol contactSheetProtocol {
    }

class ContactsSheetViewController: UIViewController {
    
    //MARK: Objects
    @objc lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Xmark20px")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray), for: .normal)
        return button
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
        title.text = "Contact me!"
        title.font = UIFont(name: "Nunito-Black", size: 40)
        title.textColor = UIColor(named: "BlackSecondary")
        title.textAlignment = .center
        return title
    }()
    
    lazy var contactViewI: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var contactViewII: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var contactViewIII: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var phoneNumberTitle: UILabel = {
        let title = UILabel()
        title.text = "Phone Number"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Bold", size: 14)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    lazy var phoneIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Call_Ringing")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
        return image
    }()
    
    lazy var phoneNumber: UILabel = {
        let label = UILabel()
        label.text = "+41 76 834 86 65"
        label.font = UIFont(name: "Nunito-Bold", size: 14)
        label.textColor = UIColor(named: "BlackLabels")
        label.textAlignment = .left
        return label
    }()
    
    lazy var email: UILabel = {
        let title = UILabel()
        title.text = "Email"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Bold", size: 14)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    lazy var emailIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "Envelope")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
        return icon
    }()
    
    lazy var emailAddress: UILabel = {
        let email = UILabel()
        email.text = "caiojob@outlook.pt"
        email.font = UIFont(name: "Nunito-Bold", size: 14)
        email.textColor = UIColor(named: "BlackLabels")
        email.textAlignment = .left
        return email
    }()
    
    lazy var linkedin: UILabel = {
        let title = UILabel()
        title.text = "Linkedin"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Bold", size: 14)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    lazy var linkedinIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "Linkedin")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
        return icon
    }()
    
    lazy var linkedinLink: UILabel = {
        let link = UILabel()
        link.text = "linkedin.com/in/caio-chaves/"
        link.font = UIFont(name: "Nunito-Bold", size: 14)
        link.textColor = UIColor(named: "BlackLabels")
        link.textAlignment = .left
        return link
    }()
    
    var delegate: contactSheetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "WhiteBackground")
        configureLayout()
    }
    
    
    
    //MARK: Configuring Layout
    private func configureLayout() {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        backgroundSheet.image = UIImage(named: "background")
        
        view.addSubview(backgroundSheet)
        view.sendSubviewToBack(backgroundSheet)
        view.addSubview(line)
        view.addSubview(dismissButton)
        view.addSubview(titlePage)
        view.addSubview(phoneNumberTitle)
        view.addSubview(contactViewI)
        view.addSubview(email)
        view.addSubview(contactViewII)
        view.addSubview(linkedin)
        view.addSubview(contactViewIII)
        contactViewI.addSubview(phoneIcon)
        contactViewI.addSubview(phoneNumber)
        contactViewII.addSubview(emailIcon)
        contactViewII.addSubview(emailAddress)
        contactViewIII.addSubview(linkedinIcon)
        contactViewIII.addSubview(linkedinLink)
        
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTitle.translatesAutoresizingMaskIntoConstraints = false
        contactViewI.translatesAutoresizingMaskIntoConstraints = false
        email.translatesAutoresizingMaskIntoConstraints = false
        contactViewII.translatesAutoresizingMaskIntoConstraints = false
        linkedin.translatesAutoresizingMaskIntoConstraints = false
        contactViewIII.translatesAutoresizingMaskIntoConstraints = false
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        emailAddress.translatesAutoresizingMaskIntoConstraints = false
        linkedinIcon.translatesAutoresizingMaskIntoConstraints = false
        linkedinLink.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            backgroundSheet.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: view.heightAnchor),
        
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            titlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titlePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            phoneNumberTitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 20),
            phoneNumberTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            contactViewI.topAnchor.constraint(equalTo: phoneNumberTitle.bottomAnchor, constant: 5),
            contactViewI.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contactViewI.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contactViewI.heightAnchor.constraint(equalToConstant: 50),
            
            phoneIcon.leadingAnchor.constraint(equalTo: contactViewI.leadingAnchor, constant: 10),
            phoneIcon.centerYAnchor.constraint(equalTo: contactViewI.centerYAnchor),
            
            phoneNumber.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 5),
            phoneNumber.centerYAnchor.constraint(equalTo: contactViewI.centerYAnchor),
            
            email.topAnchor.constraint(equalTo: contactViewI.bottomAnchor, constant: 20),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            contactViewII.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 5),
            contactViewII.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contactViewII.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contactViewII.heightAnchor.constraint(equalToConstant: 50),
            
            emailIcon.leadingAnchor.constraint(equalTo: contactViewII.leadingAnchor, constant: 10),
            emailIcon.centerYAnchor.constraint(equalTo: contactViewII.centerYAnchor),
            
            emailAddress.leadingAnchor.constraint(equalTo: emailIcon.trailingAnchor, constant: 5),
            emailAddress.centerYAnchor.constraint(equalTo: contactViewII.centerYAnchor),
            
            linkedin.topAnchor.constraint(equalTo: contactViewII.bottomAnchor, constant: 20),
            linkedin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            contactViewIII.topAnchor.constraint(equalTo: linkedin.bottomAnchor, constant: 5),
            contactViewIII.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contactViewIII.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contactViewIII.heightAnchor.constraint(equalToConstant: 50),
            
            linkedinIcon.leadingAnchor.constraint(equalTo: contactViewIII.leadingAnchor, constant: 15),
            linkedinIcon.centerYAnchor.constraint(equalTo: contactViewIII.centerYAnchor),
            
            linkedinLink.leadingAnchor.constraint(equalTo: linkedinIcon.trailingAnchor, constant: 5),
            linkedinLink.centerYAnchor.constraint(equalTo: contactViewIII.centerYAnchor),
        
        
        ])
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.view?.layer.cornerRadius = 15
                view.addGestureRecognizer(panGesture)
        
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchUpInside)
    }
    
    //DismissButto
    @objc func dismissButtonDidTapped() {
        dismiss(animated: true)
    }
    
    @objc private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
            let translation = recognizer.translation(in: view)
        
            switch recognizer.state {
            case .changed:
                if translation.y > 0 {
                    view.transform = CGAffineTransform(translationX: 0, y: translation.y)
                }
            case .ended:
                let velocity = recognizer.velocity(in: view)
                if velocity.y > 100 {
                    dismiss(animated: true, completion: nil)
                } else {
                    UIView.animate(withDuration: 0.3) {
                        self.view.transform = .identity
                    }
                }
            default:
                break
            }
        }
}
