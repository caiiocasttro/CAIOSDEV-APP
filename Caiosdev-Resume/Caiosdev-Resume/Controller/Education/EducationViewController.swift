//
//  EducationViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class EducationViewController: UIViewController {
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return filter
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 0, y: 0, width: 40, height: 40)
        button.setBackgroundImage(UIImage(named: "contact"), for: .normal)
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.clear
        return scrollView
    }()
    
    lazy var aboutMeView: CustomView = {
        let view = CustomView()
        view.backgroundColor = UIColor(named: "WhiteBackground" )
        return view
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "My education"
        title.textColor = UIColor(named: "blackSecondary")
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.textAlignment = .left
        return title
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Here you can see my education!"
        label.textColor = UIColor(named: "Gray")
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        let heightSpace = UIScreen.main.bounds.height * 0.7
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "setup")
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(contactButton)
        view.addSubview(scrollView)
        scrollView.addSubview(aboutMeView)
        aboutMeView.addSubview(titlePage)
        aboutMeView.addSubview(subtitle)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        aboutMeView.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
            
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            contactButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: heightSpace),
            aboutMeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            aboutMeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            aboutMeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            aboutMeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            aboutMeView.heightAnchor.constraint(equalToConstant: 440),
            
            titlePage.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: aboutMeView.leadingAnchor, constant: 20),
            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: aboutMeView.leadingAnchor, constant: 20)
            
        ])
        
    }
    
}
