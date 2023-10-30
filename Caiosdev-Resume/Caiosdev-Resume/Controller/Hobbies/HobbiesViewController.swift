//
//  HobbiesViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class HobbiesViewController: UIViewController {
    
    //MARK: properties
    var animatedOnce = false
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return filter
    }()
    
    lazy var titlePartI: UILabel = {
        let title = UILabel()
        title.text = "My"
        title.textColor = UIColor.white
        title.font = UIFont(name: "Nunito-Black", size: 60)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var titlePartII: UILabel = {
        let title = UILabel()
        title.text = "Passions"
        title.textColor = UIColor.white
        title.font = UIFont(name: "Nunito-Black", size: 60)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton()
        button.frame = .init(x: 0, y: 0, width: 75, height: 25)
        button.setBackgroundImage(UIImage(named: "HireMe"), for: .normal)
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
        title.text = "All the versions of me 😄"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.register(HobbiesViewCell.self, forCellReuseIdentifier: HobbiesIdentifier.main.rawValue)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
//        scrollView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
//        configuringCellCentered()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animatedOnce {
            titleAnimation()
            animatedOnce = true
        }
    }
    

    //MARK: COnfiguring layout
    private func configureLayout() {
        let background = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
        background.image = UIImage(named: "passions")
        background.contentMode = .scaleAspectFill
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
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
        hobbiesView.addSubview(tableView)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        hobbiesView.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
        
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
            
            titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundSheet.widthAnchor.constraint(equalTo: hobbiesView.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: hobbiesView.heightAnchor),
            
            hobbiesView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
            hobbiesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hobbiesView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hobbiesView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hobbiesView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            hobbiesView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 20),
            
            contactButton.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 15),
            contactButton.trailingAnchor.constraint(equalTo: hobbiesView.trailingAnchor, constant: -20),
            
            line.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: hobbiesView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: hobbiesView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: hobbiesView.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        
        ])
        
        //Adding target to contact button
        contactButton.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
    }
    
//    func configuringCellCentered() {
//        
//        let cellHeight: CGFloat = 500
//        
//        let tableViewHeight = tableView.frame.size.height
//        
//        let topInset = (tableViewHeight - cellHeight) / 2
//        
//        tableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: topInset, right: 0)
//        
//    }

    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
        }
        
        contactButtonAnimation()
        
        UIView.animate(withDuration: 0.75, delay: 1.0) {
            self.present(vc, animated: true)
        }
    }
    
    //MARK: Animations
    func titleAnimation() {
        
        UIView.animate(withDuration: 0.75) {
            self.titlePartI.alpha = 1
            self.titlePartI.frame.origin.x += 20
        } completion: { (done) in
            UIView.animate(withDuration: 1.0) {
                self.titlePartII.alpha = 1
                self.titlePartII.frame.origin.x += 20
            }
        }
    }
    
    func contactButtonAnimation() {
        self.contactButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.75) {
            self.contactButton.transform = .identity
        }
        
    }
    
    
}

extension HobbiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HobbiesModel.pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HobbiesIdentifier.main.rawValue, for: indexPath) as! HobbiesViewCell
        cell.backgroundColor = UIColor.clear
        cell.image = HobbiesModel.pictures[indexPath.row]
        cell.text = HobbiesModel.thoughts[indexPath.row]
        cell.date = HobbiesModel.dates[indexPath.row]
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    
    
}

//extension HobbiesViewController: UIScrollViewDelegate {
//  
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let center = CGPoint(x: scrollView.contentOffset.x + scrollView.bounds.size.width / 2, y: scrollView.bounds.size.height / 2)
//        
//        if let indexPath = tableView.indexPathForRow(at: center) {
//            tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
//        }
//    }
//    
//}
