//
//  ViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class AboutMeViewController: UIViewController {
    
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
    
    lazy var aboutMeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "WhiteBackground" )
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Hello, I am Caio!"
        title.textColor = UIColor(named: "blackSecondary")
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.textAlignment = .left
        return title
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        configureLayout()
    }
    
    
    
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        //Configuring background
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "picture")
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(contactButton)
        view.addSubview(scrollView)
        scrollView.addSubview(aboutMeView)
        aboutMeView.addSubview(titlePage)
        
        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        aboutMeView.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Constraints
        NSLayoutConstraint.activate([
            
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            contactButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 535),
            aboutMeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            aboutMeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            aboutMeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            aboutMeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            aboutMeView.heightAnchor.constraint(equalToConstant: 800),
            
            titlePage.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: aboutMeView.leadingAnchor, constant: 20)
            
            
        ])
        
        //Adding button's action
        contactButton.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
    }
    
    //MARK: Configuring tab button
    private func configureTabBar() {
        
        guard let item = self.tabBarController?.tabBar else { return }
        
        item.tintColor = UIColor(named: "Orange")
        item.unselectedItemTintColor = UIColor(named: "Black")
        
    }

    
    //MARK: pulling contact view
    @objc func pullContactView() {
        print("tapped")
        let vc = ContactsSheetViewController()
        let sheetVC =  UINavigationController(rootViewController: vc)
        
        sheetVC.isModalInPresentation = true
        if let sheet = sheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        
        navigationController?.present(sheetVC, animated: true)
        
    }
    
    
}

