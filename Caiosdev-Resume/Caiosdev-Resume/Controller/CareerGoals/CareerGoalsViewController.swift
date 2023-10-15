//
//  CareerGoalsViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class CareerGoalsViewController: UIViewController, contactSheetProtocol {
    
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
    
    lazy var careerGoalsView: CustomView = {
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
        name.text = "Goals"
        name.textColor = UIColor(named: "OrangeTitle")
        name.font = UIFont(name: "Nunito-Black", size: 60)
        name.textAlignment = .left
        name.numberOfLines = 0
        return name
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Let's find out!"
        title.textColor = UIColor(named: "BlackLabels")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CareerGoalsViewCell.self, forCellReuseIdentifier: CareerGoalsIdentifiers.main.rawValue)
        tableView.register(SkillsViewCell.self, forCellReuseIdentifier: CareerGoalsIdentifiers.skills.rawValue)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var cellTitle: [String] = ["Short Term", "Mid Term(2-5 yrs)", "Long Term > 5 yrs", "My initial skills for that!"]
    
    lazy var text: [String] = [CareerGoalsModel.shortTerm, CareerGoalsModel.midTerm, CareerGoalsModel.longTerm]

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
        background.image = UIImage(named: "studying")
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        backgroundSheet.image = UIImage(named: "background")
        
        //Adding subviews
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(titlePartI)
        view.addSubview(titlePartII)
        view.addSubview(scrollView)
        scrollView.addSubview(careerGoalsView)
        careerGoalsView.addSubview(backgroundSheet)
        careerGoalsView.sendSubviewToBack(backgroundSheet)
        careerGoalsView.addSubview(line)
        careerGoalsView.addSubview(titlePage)
        careerGoalsView.addSubview(contactButton)
        careerGoalsView.addSubview(tableView)

        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        careerGoalsView.translatesAutoresizingMaskIntoConstraints = false
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
            
            contactButton.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 10),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: careerGoalsView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: careerGoalsView.heightAnchor),
            
            careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: heightSpace),
            careerGoalsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            careerGoalsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            careerGoalsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            careerGoalsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            careerGoalsView.heightAnchor.constraint(equalToConstant: (height * 0.8) + 20),
            
            line.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 30),
            line.heightAnchor.constraint(equalToConstant: 2),
            line.centerXAnchor.constraint(equalTo: careerGoalsView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
//            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 5),
//            subtitle.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            
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
        present(vc, animated: true)
        
    }
}


extension CareerGoalsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CareerGoalsIdentifiers.skills.rawValue, for: indexPath) as! SkillsViewCell
            cell.title = cellTitle[3]
            cell.isUserInteractionEnabled = false
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CareerGoalsIdentifiers.main.rawValue, for: indexPath) as! CareerGoalsViewCell
             cell.title = cellTitle[indexPath.row]
             cell.textString = text[indexPath.row]
            cell.isUserInteractionEnabled = false
             return cell

        }
           }
    
    
    
    
}
