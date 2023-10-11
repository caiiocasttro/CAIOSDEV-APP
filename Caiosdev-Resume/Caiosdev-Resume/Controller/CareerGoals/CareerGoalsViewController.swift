//
//  CareerGoalsViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class CareerGoalsViewController: UIViewController {
    
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
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var careerGoalsView: CustomView = {
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
        title.text = "My career goals"
        title.textColor = UIColor(named: "BlackLabels")
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.textAlignment = .left
        return title
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Let's talk about my goals!"
        label.textColor = UIColor(named: "GrayLabels")
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CareerGoalsViewCell.self, forCellReuseIdentifier: CareerGoalsIdentifiers.main.rawValue)
        tableView.register(SkillsViewCell.self, forCellReuseIdentifier: CareerGoalsIdentifiers.skills.rawValue)
        tableView.backgroundColor = UIColor(named: "WhiteBackground")
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
        
        //Adding subviews
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(contactButton)
        view.addSubview(scrollView)
        scrollView.addSubview(careerGoalsView)
        careerGoalsView.addSubview(line)
        careerGoalsView.addSubview(titlePage)
        careerGoalsView.addSubview(subtitle)
        careerGoalsView.addSubview(tableView)

        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        careerGoalsView.translatesAutoresizingMaskIntoConstraints = false
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
            
            contactButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: heightSpace),
            careerGoalsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            careerGoalsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            careerGoalsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            careerGoalsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            careerGoalsView.heightAnchor.constraint(equalToConstant: (height * 0.8) - 20),
            
            line.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 30),
            line.heightAnchor.constraint(equalToConstant: 2),
            line.centerXAnchor.constraint(equalTo: careerGoalsView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        
        
        
        ])
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
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CareerGoalsIdentifiers.main.rawValue, for: indexPath) as! CareerGoalsViewCell
             cell.title = cellTitle[indexPath.row]
             cell.textString = text[indexPath.row]
             return cell

        }
           }
    
    
    
    
}
