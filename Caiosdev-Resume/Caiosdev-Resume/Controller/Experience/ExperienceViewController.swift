//
//  ExperienceViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class ExperienceViewController: UIViewController, contactSheetProtocol {
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.1)
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
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var experienceView: CustomView = {
        let view = CustomView()
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
        title.text = "Experience"
        title.textColor = UIColor(named: "BlackLabels")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Let me tell you about my experience!"
        label.textColor = UIColor(named: "GrayLabels")
        label.font = UIFont(name: "Nunito-SemiBold", size: 14)
        label.textAlignment = .left
        return label
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
        
        
        tableView.delegate = self
        tableView.dataSource = self
        configureLayout()
    }
    
    //MARK: Configuring layout
    private func configureLayout() {
        let heightSpace = (UIScreen.main.bounds.height * 0.7) + 5
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "office")
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        backgroundSheet.image = UIImage(named: "background")
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(scrollView)
        scrollView.addSubview(experienceView)
        experienceView.addSubview(backgroundSheet)
        experienceView.sendSubviewToBack(backgroundSheet)
        experienceView.addSubview(line)
        experienceView.addSubview(titlePage)
        experienceView.addSubview(subtitle)
        experienceView.addSubview(contactButton)
        experienceView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        experienceView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
        
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            contactButton.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 10),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: experienceView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: experienceView.heightAnchor),
            
            experienceView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: heightSpace),
            experienceView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            experienceView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            experienceView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            experienceView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            experienceView.heightAnchor.constraint(equalToConstant: (height * 0.8) - 20),
            
            line.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 30),
            line.heightAnchor.constraint(equalToConstant: 2),
            line.centerXAnchor.constraint(equalTo: experienceView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: experienceView.leadingAnchor, constant: 20),
            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: experienceView.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 30),
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
        vc.delegate = self
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 15
        }
        present(vc, animated: true)
        
    }
    
}


extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceIdentifiers.main.rawValue, for: indexPath) as! ExperienceViewCell
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    
}
