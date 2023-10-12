//
//  EducationViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class EducationViewController: UIViewController, contactSheetProtocol {
    
    
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
    
    lazy var educationView: CustomView = {
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
        title.text = "My education"
        title.textColor = UIColor(named: "BlackLabels")
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.textAlignment = .left
        return title
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Here you can see my education!"
        label.textColor = UIColor(named: "GrayLabels")
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "WhiteBackground")
        tableView.register(EducationViewCell.self, forCellReuseIdentifier: EducationIdentifiers.education.rawValue)
        tableView.register(CertificateViewCell.self, forCellReuseIdentifier: EducationIdentifiers.certificate.rawValue)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
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
        background.image = UIImage(named: "setup")
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
//        view.addSubview(contactButton)
        view.addSubview(scrollView)
        scrollView.addSubview(educationView)
        educationView.addSubview(line)
        educationView.addSubview(titlePage)
        educationView.addSubview(subtitle)
        educationView.addSubview(contactButton)
        educationView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        educationView.translatesAutoresizingMaskIntoConstraints = false
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
            
            contactButton.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 10),
            contactButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            educationView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: heightSpace),
            educationView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            educationView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            educationView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            educationView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            educationView.heightAnchor.constraint(equalToConstant: (height * 0.8) - 20),
            
            line.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 30),
            line.heightAnchor.constraint(equalToConstant: 2),
            line.centerXAnchor.constraint(equalTo: educationView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: educationView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: educationView.leadingAnchor, constant: 20),
            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: educationView.leadingAnchor, constant: 20),
            
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

//MARK: TableView Delegate & DataSource
extension EducationViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EducationIdentifiers.certificate.rawValue, for: indexPath) as! CertificateViewCell
            cell.backgroundColor = UIColor(named: "WhiteBackground")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EducationIdentifiers.education.rawValue, for: indexPath) as! EducationViewCell
            cell.backgroundColor = UIColor(named: "WhiteBackground")
            return cell
        }
        
    }
    
    
}
