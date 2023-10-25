//
//  CareerGoalsViewController.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit

class CareerGoalsViewController: UIViewController {
    
    //MARK: Properties
    var fiveYrsToggle = false
    
    var twoYrsToggle = false
    
    var oneYearToggle = false
    
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
        name.text = "Goals"
        name.textColor = UIColor.white
        name.font = UIFont(name: "Nunito-Black", size: 60)
        name.textAlignment = .left
        name.numberOfLines = 0
        return name
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Dreams to Reality 🚀"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Black", size: 20)
        title.textAlignment = .left
        return title
    }()
    
    lazy var chartView: UIImageView = {
        let chart = UIImageView()
        chart.frame = .init(x: 0, y: 0, width: 350, height: 600)
        chart.image = UIImage(named: "Chart")
        return chart
    }()
    
    lazy var fiveYrsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "5yrs+"), for: .normal)
        return button
    }()
    
    lazy var fiveYrsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.isHidden = true
        return view
    }()
    
    lazy var curveTopRight: UIImageView = {
        let curve = UIImageView()
        curve.image = UIImage(named: "curveTopRight")
        curve.isHidden = true
        return curve
    }()
    
    lazy var fiveYrsText: UILabel = {
        let text = UILabel()
        text.text = CareerGoalsModel.longTerm
        text.font = UIFont(name: "Nunito-Bold", size: 12)
        text.textColor = UIColor(named: "BlackLabels")
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    lazy var twoYrsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "2-5yrs"), for: .normal)
        return button
    }()
    
    lazy var twoYrsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.isHidden = true
        return view
    }()
    
    lazy var curveTop: UIImageView = {
        let curve = UIImageView()
        curve.image = UIImage(named: "curveTop")
        curve.isHidden = true
        return curve
    }()
    
    lazy var twoYrsText: UILabel = {
        let text = UILabel()
        text.text = CareerGoalsModel.midTerm
        text.font = UIFont(name: "Nunito-Bold", size: 12)
        text.textColor = UIColor(named: "BlackLabels")
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    lazy var oneYearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "1-2yrs"), for: .normal)
        return button
    }()
    
    lazy var oneYearView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.isHidden = true
        return view
    }()
    
    lazy var curveLeft: UIImageView = {
        let curve = UIImageView()
        curve.image = UIImage(named: "curveLeft")
        curve.isHidden = true
        return curve
    }()
    
    lazy var oneYearText: UILabel = {
        let text = UILabel()
        text.text = CareerGoalsModel.shortTerm
        text.font = UIFont(name: "Nunito-Bold", size: 12)
        text.textColor = UIColor(named: "BlackLabels")
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        let background = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
        background.image = UIImage(named: "studying")
        background.contentMode = .scaleAspectFill
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: ConstraintsManager.width, height: ConstraintsManager.height))
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
        careerGoalsView.addSubview(chartView)
        careerGoalsView.addSubview(fiveYrsButton)
        careerGoalsView.addSubview(fiveYrsView)
        careerGoalsView.addSubview(curveTopRight)
        fiveYrsView.addSubview(fiveYrsText)
        careerGoalsView.addSubview(twoYrsButton)
        careerGoalsView.addSubview(twoYrsView)
        careerGoalsView.addSubview(curveTop)
        twoYrsView.addSubview(twoYrsText)
        careerGoalsView.addSubview(oneYearButton)
        careerGoalsView.addSubview(oneYearView)
        careerGoalsView.addSubview(curveLeft)
        oneYearView.addSubview(oneYearText)
        
        
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
        chartView.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsButton.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsView.translatesAutoresizingMaskIntoConstraints = false
        curveTopRight.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsText.translatesAutoresizingMaskIntoConstraints = false
        twoYrsButton.translatesAutoresizingMaskIntoConstraints = false
        twoYrsView.translatesAutoresizingMaskIntoConstraints = false
        curveTop.translatesAutoresizingMaskIntoConstraints = false
        twoYrsText.translatesAutoresizingMaskIntoConstraints = false
        oneYearButton.translatesAutoresizingMaskIntoConstraints = false
        oneYearView.translatesAutoresizingMaskIntoConstraints = false
        oneYearText.translatesAutoresizingMaskIntoConstraints = false
        curveLeft.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        NSLayoutConstraint.activate([
            
            background.widthAnchor.constraint(equalToConstant: view.bounds.width),
            background.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
            filter.heightAnchor.constraint(equalToConstant: view.bounds.height),
            
            titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
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
            
            careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
            careerGoalsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            careerGoalsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            careerGoalsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            careerGoalsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            careerGoalsView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 20),
            
            line.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 10),
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.centerXAnchor.constraint(equalTo: careerGoalsView.centerXAnchor),
            
            titlePage.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 20),
            titlePage.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            
            chartView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.9)),
            chartView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height * 0.7)),
            chartView.centerXAnchor.constraint(equalTo: careerGoalsView.centerXAnchor),
            chartView.bottomAnchor.constraint(equalTo: careerGoalsView.bottomAnchor),
            
            fiveYrsButton.topAnchor.constraint(equalTo: chartView.topAnchor, constant: ((UIScreen.main.bounds.height * 0.1) - 25)),
            fiveYrsButton.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -((UIScreen.main.bounds.height * 0.1) - 40)),
            
            fiveYrsView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.8)),
            fiveYrsView.topAnchor.constraint(equalTo: fiveYrsButton.bottomAnchor, constant: 5),
            fiveYrsView.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            
            curveTopRight.topAnchor.constraint(equalTo: fiveYrsView.topAnchor, constant: -4),
            curveTopRight.trailingAnchor.constraint(equalTo: fiveYrsView.trailingAnchor),
            
            fiveYrsText.topAnchor.constraint(equalTo: fiveYrsView.topAnchor, constant: 10),
            fiveYrsText.leadingAnchor.constraint(equalTo: fiveYrsView.leadingAnchor, constant: 10),
            fiveYrsText.trailingAnchor.constraint(equalTo: fiveYrsView.trailingAnchor, constant: -10),
            fiveYrsText.bottomAnchor.constraint(equalTo: fiveYrsView.bottomAnchor, constant: -10),
            
            twoYrsButton.topAnchor.constraint(equalTo: chartView.topAnchor, constant: ((UIScreen.main.bounds.height * 0.2) + 58)),
            twoYrsButton.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -((UIScreen.main.bounds.height * 0.2) - 35)),
            
            curveTop.bottomAnchor.constraint(equalTo: twoYrsView.topAnchor, constant: 2),
            curveTop.leadingAnchor.constraint(equalTo: twoYrsButton.trailingAnchor, constant: 20),
            
            twoYrsView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.8)),
            twoYrsView.topAnchor.constraint(equalTo: twoYrsButton.bottomAnchor, constant: 5),
            twoYrsView.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            
            twoYrsText.topAnchor.constraint(equalTo: twoYrsView.topAnchor, constant: 10),
            twoYrsText.leadingAnchor.constraint(equalTo: twoYrsView.leadingAnchor, constant: 10),
            twoYrsText.trailingAnchor.constraint(equalTo: twoYrsView.trailingAnchor, constant: -10),
            twoYrsText.bottomAnchor.constraint(equalTo: twoYrsView.bottomAnchor, constant: -10),
            
            oneYearButton.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -((UIScreen.main.bounds.height * 0.2))),
            oneYearButton.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -((UIScreen.main.bounds.height * 0.3) + 15)),
            
            oneYearView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.5)),
            oneYearView.topAnchor.constraint(equalTo: oneYearButton.centerYAnchor),
            oneYearView.leadingAnchor.constraint(equalTo: oneYearButton.trailingAnchor, constant: 35),
            
            oneYearText.topAnchor.constraint(equalTo: oneYearView.topAnchor, constant: 10),
            oneYearText.leadingAnchor.constraint(equalTo: oneYearView.leadingAnchor, constant: 10),
            oneYearText.trailingAnchor.constraint(equalTo: oneYearView.trailingAnchor, constant: -10),
            oneYearText.bottomAnchor.constraint(equalTo: oneYearView.bottomAnchor, constant: -10),
            
            curveLeft.topAnchor.constraint(equalTo: oneYearButton.centerYAnchor),
            curveLeft.leadingAnchor.constraint(equalTo: oneYearView.leadingAnchor, constant: -4),
            
            
            
            
            
            
        ])
        
        //Adding button's action
        contactButton.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        fiveYrsButton.addTarget(self, action: #selector(fiveYrsDidTapped), for: .touchUpInside)
        twoYrsButton.addTarget(self, action: #selector(twoYrsDidTapped), for: .touchUpInside)
        oneYearButton.addTarget(self, action: #selector(oneYearDidTapped), for: .touchUpInside)
        
    }
    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 15
        }
        
        UIView.animate(withDuration: 0.3) {
            self.present(vc, animated: true)
        }
    }
    
    @objc func fiveYrsDidTapped() {
        fiveYrsToggle.toggle()
        
        if fiveYrsToggle {
            self.fiveYrsView.isHidden = false
            self.curveTopRight.isHidden = false
            self.fiveYrsButton.setImage(UIImage(named: "5yrs+ hide"), for: .normal)
            fiveYrsAnimation()
            
        } else {
            self.fiveYrsView.isHidden = true
            self.curveTopRight.isHidden = true
            self.fiveYrsButton.setImage(UIImage(named: "5yrs+"), for: .normal)
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func twoYrsDidTapped() {
        
        twoYrsToggle.toggle()
        
        if twoYrsToggle {
            self.twoYrsView.isHidden = false
            self.curveTop.isHidden = false
            self.twoYrsButton.setImage(UIImage(named: "2-5yrs hide"), for: .normal)
            twoYrsAnimation()
        } else {
            self.twoYrsView.isHidden = true
            self.curveTop.isHidden = true
            self.twoYrsButton.setImage(UIImage(named: "2-5yrs"), for: .normal)
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func oneYearDidTapped() {
        
        oneYearToggle.toggle()
        
        if oneYearToggle {
            
            self.oneYearView.isHidden = false
            self.curveLeft.isHidden = false
            self.oneYearButton.setImage(UIImage(named: "1-2yrs hide"), for: .normal)
            oneYearAnimation()
            
        } else {
            
            self.oneYearView.isHidden = true
            self.curveLeft.isHidden = true
            self.oneYearButton.setImage(UIImage(named: "1-2yrs"), for: .normal)
            
        }
    }
    
    //MARK: Animations
    func fiveYrsAnimation() {
        self.curveTopRight.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.fiveYrsView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3) {
            self.curveTopRight.transform = .identity
            self.fiveYrsView.transform = .identity
        }
    }
    
    func twoYrsAnimation() {
        self.curveTop.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.twoYrsView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3) {
            self.curveTop.transform = .identity
            self.twoYrsView.transform = .identity
        }
    }
    
    func oneYearAnimation() {
        self.curveLeft.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.oneYearView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3) {
            self.curveLeft.transform = .identity
            self.oneYearView.transform = .identity
        }
    }
}

