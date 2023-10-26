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
    
    var titleAnimatedOnce = false
    
    var bubbleAnimatedOnce = false
    
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
        title.text = "Goals"
        title.textColor = UIColor.white
        title.font = UIFont(name: "Nunito-Black", size: 60)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
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
    
    lazy var fiveYrsIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "5yrs+")
        return view
    }()
    
    lazy var fiveYrsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    lazy var curveTopRight: UIImageView = {
        let curve = UIImageView()
        curve.image = UIImage(named: "curveTopRight")
        curve.isHidden = true
        curve.alpha = 0
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
    
    lazy var twoYrsIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "2-5yrs")
        return view
    }()
    
    lazy var twoYrsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    lazy var curveTop: UIImageView = {
        let curve = UIImageView()
        curve.image = UIImage(named: "curveTop")
        curve.isHidden = true
        curve.alpha = 0
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
    
    lazy var oneYearIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "1-2yrs")
        return view
    }()
    
    lazy var oneYearView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 15
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    lazy var curveLeft: UIImageView = {
        let curve = UIImageView()
        curve.image = UIImage(named: "curveLeft")
        curve.isHidden = true
        curve.alpha = 0
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
        
        scrollView.delegate = self
        
        
        //Layout
        configureLayout()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !titleAnimatedOnce {
            titleAnimation()
            titleAnimatedOnce = true
        }
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
        careerGoalsView.addSubview(fiveYrsIcon)
        careerGoalsView.addSubview(fiveYrsView)
        careerGoalsView.addSubview(curveTopRight)
        fiveYrsView.addSubview(fiveYrsText)
        careerGoalsView.addSubview(twoYrsIcon)
        careerGoalsView.addSubview(twoYrsView)
        careerGoalsView.addSubview(curveTop)
        twoYrsView.addSubview(twoYrsText)
        careerGoalsView.addSubview(oneYearIcon)
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
        fiveYrsIcon.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsView.translatesAutoresizingMaskIntoConstraints = false
        curveTopRight.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsText.translatesAutoresizingMaskIntoConstraints = false
        twoYrsIcon.translatesAutoresizingMaskIntoConstraints = false
        twoYrsView.translatesAutoresizingMaskIntoConstraints = false
        curveTop.translatesAutoresizingMaskIntoConstraints = false
        twoYrsText.translatesAutoresizingMaskIntoConstraints = false
        oneYearIcon.translatesAutoresizingMaskIntoConstraints = false
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
            
            titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
            
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
            
            fiveYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: ((UIScreen.main.bounds.height * 0.1) - 25)),
            fiveYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -((UIScreen.main.bounds.height * 0.1) - 40)),
            
            fiveYrsView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.8)),
            fiveYrsView.topAnchor.constraint(equalTo: fiveYrsIcon.bottomAnchor, constant: 5),
            fiveYrsView.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            
            curveTopRight.topAnchor.constraint(equalTo: fiveYrsView.topAnchor, constant: -4),
            curveTopRight.trailingAnchor.constraint(equalTo: fiveYrsView.trailingAnchor),
            
            fiveYrsText.topAnchor.constraint(equalTo: fiveYrsView.topAnchor, constant: 10),
            fiveYrsText.leadingAnchor.constraint(equalTo: fiveYrsView.leadingAnchor, constant: 10),
            fiveYrsText.trailingAnchor.constraint(equalTo: fiveYrsView.trailingAnchor, constant: -10),
            fiveYrsText.bottomAnchor.constraint(equalTo: fiveYrsView.bottomAnchor, constant: -10),
            
            twoYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: ((UIScreen.main.bounds.height * 0.2) + 58)),
            twoYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -((UIScreen.main.bounds.height * 0.2) - 35)),
            
            curveTop.bottomAnchor.constraint(equalTo: twoYrsView.topAnchor, constant: 2),
            curveTop.leadingAnchor.constraint(equalTo: twoYrsIcon.trailingAnchor, constant: 20),
            
            twoYrsView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.8)),
            twoYrsView.topAnchor.constraint(equalTo: twoYrsIcon.bottomAnchor, constant: 5),
            twoYrsView.leadingAnchor.constraint(equalTo: careerGoalsView.leadingAnchor, constant: 20),
            
            twoYrsText.topAnchor.constraint(equalTo: twoYrsView.topAnchor, constant: 10),
            twoYrsText.leadingAnchor.constraint(equalTo: twoYrsView.leadingAnchor, constant: 10),
            twoYrsText.trailingAnchor.constraint(equalTo: twoYrsView.trailingAnchor, constant: -10),
            twoYrsText.bottomAnchor.constraint(equalTo: twoYrsView.bottomAnchor, constant: -10),
            
            oneYearIcon.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -((UIScreen.main.bounds.height * 0.2))),
            oneYearIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -((UIScreen.main.bounds.height * 0.3) + 15)),
            
            oneYearView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.5)),
            oneYearView.topAnchor.constraint(equalTo: oneYearIcon.centerYAnchor),
            oneYearView.leadingAnchor.constraint(equalTo: oneYearIcon.trailingAnchor, constant: 35),
            
            oneYearText.topAnchor.constraint(equalTo: oneYearView.topAnchor, constant: 10),
            oneYearText.leadingAnchor.constraint(equalTo: oneYearView.leadingAnchor, constant: 10),
            oneYearText.trailingAnchor.constraint(equalTo: oneYearView.trailingAnchor, constant: -10),
            oneYearText.bottomAnchor.constraint(equalTo: oneYearView.bottomAnchor, constant: -10),
            
            curveLeft.topAnchor.constraint(equalTo: oneYearIcon.centerYAnchor),
            curveLeft.leadingAnchor.constraint(equalTo: oneYearView.leadingAnchor, constant: -4),
            
            
            
            
            
            
        ])
        
        //Adding button's action
        contactButton.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        
        
        
    }
    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 15
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
    
    
    func fiveYrsAnimation() {
        self.fiveYrsView.isHidden = false
        self.curveTopRight.isHidden = false
        self.curveTopRight.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.fiveYrsView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 1.0, delay: 1.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            self.curveTopRight.transform = .identity
            self.fiveYrsView.transform = .identity
            self.fiveYrsView.alpha = 1
            self.curveTopRight.alpha = 1
        }
    }
    
    func twoYrsAnimation() {
        self.twoYrsView.isHidden = false
        self.curveTop.isHidden = false
        self.curveTop.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.twoYrsView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            self.curveTop.transform = .identity
            self.twoYrsView.transform = .identity
            self.twoYrsView.alpha = 1
            self.curveTop.alpha = 1
        }
    }
    
    func oneYearAnimation() {
        self.oneYearView.isHidden = false
        self.curveLeft.isHidden = false
        self.curveLeft.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        self.oneYearView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            self.curveLeft.transform = .identity
            self.oneYearView.transform = .identity
            self.oneYearView.alpha = 1
            self.curveLeft.alpha = 1
        }
    }
    
    func contactButtonAnimation() {
        self.contactButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.75) {
            self.contactButton.transform = .identity
        }
        
    }

}

extension CareerGoalsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeigt = scrollView.frame.size.height
        let contentViewHeigt = scrollView.contentSize.height
        let yOffset = scrollView.contentOffset.y
        
        let shouldAnimate: CGFloat = 50
        
        if yOffset + scrollViewHeigt + shouldAnimate >= contentViewHeigt {
            
            if !bubbleAnimatedOnce {
                fiveYrsAnimation()
                twoYrsAnimation()
                oneYearAnimation()
                bubbleAnimatedOnce = true
            }
                
        }
        
        
        
    }
    
}

