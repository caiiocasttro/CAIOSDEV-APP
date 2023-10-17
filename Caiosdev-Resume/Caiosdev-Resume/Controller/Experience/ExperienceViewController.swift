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
        line.backgroundColor = UIColor(named: "BlackSecondary")
        line.layer.cornerRadius = 2.5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var titlePartI: UILabel = {
        let hello = UILabel()
        hello.text = "My"
        hello.textColor = UIColor.white
        hello.font = UIFont(name: "Nunito-Black", size: 60)
        hello.textAlignment = .left
        hello.numberOfLines = 0
        return hello
    }()
    
    lazy var titlePartII: UILabel = {
        let name = UILabel()
        name.text = "Experience"
        name.textColor = UIColor.white
        name.font = UIFont(name: "Nunito-Black", size: 60)
        name.textAlignment = .left
        name.numberOfLines = 0
        return name
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Professional Path Stories"
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
        view.addSubview(titlePartI)
        view.addSubview(titlePartII)
        view.addSubview(scrollView)
        scrollView.addSubview(experienceView)
        experienceView.addSubview(backgroundSheet)
        experienceView.sendSubviewToBack(backgroundSheet)
        experienceView.addSubview(line)
        experienceView.addSubview(titlePage)
        experienceView.addSubview(contactButton)
        experienceView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        experienceView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
        
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (height * 0.6)),
            titlePartI.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
            titlePartII.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
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
            experienceView.heightAnchor.constraint(equalToConstant: (height * 0.8) + 20),
            
            line.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: experienceView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: experienceView.leadingAnchor, constant: 20),
            
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
        vc.delegate = self
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 15
        }
        UIView.animate(withDuration: 0.3) {
            self.present(vc, animated: true)
        }
        
    }
    
}


extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceIdentifiers.main.rawValue, for: indexPath) as! ExperienceViewCell
        cell.isUserInteractionEnabled = false
        cell.position = MyExperienceModel.position[indexPath.row]
        cell.location = MyExperienceModel.companies[indexPath.row]
        if indexPath.row == 0 {
            cell.taskI = MyExperienceModel.skySwitzerland[0]
            cell.taskII = MyExperienceModel.skySwitzerland[1]
            cell.taskIII = MyExperienceModel.skySwitzerland[2]
        } else if indexPath.row == 1 {
            cell.taskI = MyExperienceModel.eccosalva[0]
            cell.taskII = MyExperienceModel.eccosalva[1]
            cell.taskIII = MyExperienceModel.eccosalva[2]
        } else if indexPath.row == 2 {
            cell.taskI = MyExperienceModel.arcor[0]
            cell.taskII = MyExperienceModel.arcor[1]
            cell.taskIII = MyExperienceModel.arcor[2]
        } else if indexPath.row == 3 {
            cell.taskI = MyExperienceModel.motiva[0]
            cell.taskII = MyExperienceModel.motiva[1]
            cell.taskIII = MyExperienceModel.motiva[2]
        }
        return cell
    }
    
    
}
