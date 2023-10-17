//
//  HobbiesViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class HobbiesViewController: UIViewController, contactSheetProtocol {
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return filter
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
        name.text = "Hobbies"
        name.textColor = UIColor.white
        name.font = UIFont(name: "Nunito-Black", size: 60)
        name.textAlignment = .left
        name.numberOfLines = 0
        return name
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
    
    lazy var hobbiesView: CustomView = {
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
    
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Welcome to my life :)"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    

    //MARK: COnfiguring layout
    private func configureLayout() {
        let heightSpace = (UIScreen.main.bounds.height * 0.7) + 5
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let background = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        background.image = UIImage(named: "travel")
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        backgroundSheet.image = UIImage(named: "background")
        
        //Adding subview
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(titlePartI)
        view.addSubview(titlePartII)
        view.addSubview(scrollView)
        scrollView.addSubview(hobbiesView)
        hobbiesView.addSubview(backgroundSheet)
        hobbiesView.sendSubviewToBack(backgroundSheet)
        hobbiesView.addSubview(line)
        hobbiesView.addSubview(titlePage)
        hobbiesView.addSubview(contactButton)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        hobbiesView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: hobbiesView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: hobbiesView.heightAnchor),
            
            hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: heightSpace),
            hobbiesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hobbiesView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hobbiesView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hobbiesView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            hobbiesView.heightAnchor.constraint(equalToConstant: (height * 0.8) + 20),
            
            contactButton.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 10),
            contactButton.trailingAnchor.constraint(equalTo: hobbiesView.trailingAnchor, constant: -10),
            
            line.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: hobbiesView.leadingAnchor, constant: 20)
        
        ])
        
        //Adding target to contact button
        contactButton.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
    }
    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
        }
        
        UIView.animate(withDuration: 0.3) {
            self.present(vc, animated: true)
        }
        
        
    }

}
