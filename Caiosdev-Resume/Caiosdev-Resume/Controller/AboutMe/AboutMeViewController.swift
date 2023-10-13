//
//  ViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class AboutMeViewController: UIViewController, contactSheetProtocol {
    
    //MARK: Initializer
    private let sheet = ContactsSheetViewController()
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return filter
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 0, y: 0, width: 20, height: 20)
        button.setBackgroundImage(UIImage(named: "contact30px"), for: .normal)
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.clear
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var aboutMeView: CustomView = {
        let view = CustomView()
        view.backgroundColor = UIColor(named: "WhiteBackground" )
        return view
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackLabels")
        line.layer.cornerRadius = 1
        line.clipsToBounds = true
        return line
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Hello, I am Caio!"
        title.textColor = UIColor(named: "BlackLabels")
        title.font = .systemFont(ofSize: 20, weight: .bold)
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
        tableView.backgroundColor = UIColor(named: "WhiteBackground")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureTabBar()
        configureLayout()
    }
    
    
    
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        
        let heightSpace = (UIScreen.main.bounds.height * 0.7) + 5
        
        
        //Configuring background
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "picture")
        
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
//        view.addSubview(contactButton)
        view.addSubview(scrollView)
        scrollView.addSubview(aboutMeView)
        aboutMeView.addSubview(line)
        aboutMeView.addSubview(titlePage)
        aboutMeView.addSubview(contactButton)
        aboutMeView.addSubview(tableView)
        
        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        aboutMeView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Constraints
        NSLayoutConstraint.activate([
            
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            contactButton.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 10),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            aboutMeView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: heightSpace),
            aboutMeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            aboutMeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            aboutMeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            aboutMeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            aboutMeView.heightAnchor.constraint(equalToConstant: (height * 0.8) - 20),
            
            line.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 30),
            line.heightAnchor.constraint(equalToConstant: 2),
            line.centerXAnchor.constraint(equalTo: aboutMeView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: aboutMeView.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
            
        ])
        
        //Adding button's action
        contactButton.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
    }
    
    //MARK: Configuring tab button
    private func configureTabBar() {
        
        guard let item = self.tabBarController?.tabBar else { return }
        
        item.tintColor = UIColor(named: "OrangeIcon")
        item.unselectedItemTintColor = UIColor(named: "BlackLabels")
        
    }

    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 15
        }
        present(vc, animated: true)
        
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
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutMeIdentifiers.Location.rawValue, for: indexPath) as! LocationViewCell
            cell.title = cellTitle[3]
            cell.textString = text[2]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutMeIdentifiers.main.rawValue, for: indexPath) as! AboutMeTableViewCell
            cell.title = cellTitle[indexPath.row]
            cell.textString = text[indexPath.row]
            return cell
        }
    }
    
    
}

