//
//  CareerGoalsViewController.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 07.10.2023.
//

import UIKit
import AVFoundation

class CareerGoalsViewController: UIViewController {
    
    //MARK: Properties
    var fiveYrsToggle = false
    
    var twoYrsToggle = false
    
    var oneYearToggle = false
    
    var titleAnimatedOnce = false
    
    var bubbleAnimatedOnce = false
    
    var buttonShowed = false
    
    //MARK: Initializer
    var bubbleEffect: AVAudioPlayer?
    
    var click: AVAudioPlayer?
    
    var feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    
    //MARK: Objects
    lazy var filter: UIView = {
        let filter = UIView()
        filter.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return filter
    }()
    
    lazy var contactButtonI: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.baseBackgroundColor = UIColor.white
        configuration.title = "Hire me"
        configuration.baseForegroundColor = UIColor(named: "OrangeTitle")
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { text in
            var newText = text
            newText.font = DeviceType.isIphone5 ? UIFont(name: "Nunito-Black", size: 12) : UIFont(name: "Nunito-Black", size: 18)
            return newText
        }
        configuration.cornerStyle = .capsule
        button.configuration = configuration
        return button
    }()
    
    lazy var contactButtonII: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        configuration.baseBackgroundColor = UIColor(named: "OrangeTitle")
        configuration.title = "Hire me"
        configuration.baseForegroundColor = UIColor.white
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { text in
            var newText = text
            newText.font = DeviceType.isIphone5 ? UIFont(name: "Nunito-Black", size: 12) : UIFont(name: "Nunito-Black", size: 18)
            return newText
        }
        configuration.cornerStyle = .capsule
        button.configuration = configuration
        button.alpha = 0
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
        title.textAlignment = .left
        title.numberOfLines = 0
        title.alpha = 0
        return title
    }()
    
    lazy var titlePartII: UILabel = {
        let title = UILabel()
        title.text = "Goals"
        title.textColor = UIColor.white
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
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var fiveYrsBubble: UIView = {
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
        text.textColor = UIColor(named: "BlackLabels")
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    lazy var twoYrsIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "2-5yrs")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var twoYrsBubble: UIView = {
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
        text.textColor = UIColor(named: "BlackLabels")
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    lazy var oneYearIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "1-2yrs")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var oneYearBubble: UIView = {
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
        
        //Preparing sound
        prepareSoundEffect()
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
        
        let leading = view.layoutMarginsGuide.leadingAnchor
        let trailing = view.layoutMarginsGuide.trailingAnchor
        
        //Adding subviews
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(filter)
        view.addSubview(titlePartI)
        view.addSubview(titlePartII)
        view.addSubview(scrollView)
        scrollView.addSubview(contactButtonI)
        scrollView.addSubview(careerGoalsView)
        careerGoalsView.addSubview(backgroundSheet)
        careerGoalsView.sendSubviewToBack(backgroundSheet)
        careerGoalsView.addSubview(line)
        careerGoalsView.addSubview(titlePage)
        careerGoalsView.addSubview(contactButtonII)
        careerGoalsView.addSubview(chartView)
        careerGoalsView.addSubview(fiveYrsIcon)
        careerGoalsView.addSubview(fiveYrsBubble)
        careerGoalsView.addSubview(curveTopRight)
        fiveYrsBubble.addSubview(fiveYrsText)
        careerGoalsView.addSubview(twoYrsIcon)
        careerGoalsView.addSubview(twoYrsBubble)
        careerGoalsView.addSubview(curveTop)
        twoYrsBubble.addSubview(twoYrsText)
        careerGoalsView.addSubview(oneYearIcon)
        careerGoalsView.addSubview(oneYearBubble)
        careerGoalsView.addSubview(curveLeft)
        oneYearBubble.addSubview(oneYearText)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        titlePartI.translatesAutoresizingMaskIntoConstraints = false
        titlePartII.translatesAutoresizingMaskIntoConstraints = false
        contactButtonI.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        careerGoalsView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        contactButtonII.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsIcon.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsBubble.translatesAutoresizingMaskIntoConstraints = false
        curveTopRight.translatesAutoresizingMaskIntoConstraints = false
        fiveYrsText.translatesAutoresizingMaskIntoConstraints = false
        twoYrsIcon.translatesAutoresizingMaskIntoConstraints = false
        twoYrsBubble.translatesAutoresizingMaskIntoConstraints = false
        curveTop.translatesAutoresizingMaskIntoConstraints = false
        twoYrsText.translatesAutoresizingMaskIntoConstraints = false
        oneYearIcon.translatesAutoresizingMaskIntoConstraints = false
        oneYearBubble.translatesAutoresizingMaskIntoConstraints = false
        oneYearText.translatesAutoresizingMaskIntoConstraints = false
        curveLeft.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
            NSLayoutConstraint.activate([
                
                background.widthAnchor.constraint(equalToConstant: view.bounds.width),
                background.heightAnchor.constraint(equalToConstant: view.bounds.height),
                
                filter.widthAnchor.constraint(equalToConstant: view.bounds.width),
                filter.heightAnchor.constraint(equalToConstant: view.bounds.height),

                contactButtonI.topAnchor.constraint(equalTo: view.topAnchor, constant: ((ConstraintsManager.height * 0.1) - 30)),
                contactButtonI.trailingAnchor.constraint(equalTo: trailing),
                
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                backgroundSheet.widthAnchor.constraint(equalTo: careerGoalsView.widthAnchor),
                backgroundSheet.heightAnchor.constraint(equalTo: careerGoalsView.heightAnchor),
                
                //Career View
                careerGoalsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                careerGoalsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                careerGoalsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                careerGoalsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                
                //Dragger line
                line.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 10),
                line.widthAnchor.constraint(equalToConstant: 35),
                line.heightAnchor.constraint(equalToConstant: 5),
                line.centerXAnchor.constraint(equalTo: careerGoalsView.centerXAnchor),
                
                //Title for the page
                titlePage.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 15),
                titlePage.leadingAnchor.constraint(equalTo: leading),
                
                //Contact Button 2nd
                contactButtonII.topAnchor.constraint(equalTo: careerGoalsView.topAnchor, constant: 15),
                contactButtonII.trailingAnchor.constraint(equalTo: trailing),
                
                //Five years bubble
                fiveYrsBubble.topAnchor.constraint(equalTo: fiveYrsIcon.bottomAnchor, constant: 5),
                fiveYrsBubble.leadingAnchor.constraint(equalTo: leading),
                fiveYrsBubble.trailingAnchor.constraint(equalTo: trailing),
                
                //Custom curve for five years bubble
                curveTopRight.topAnchor.constraint(equalTo: fiveYrsBubble.topAnchor, constant: -4),
                curveTopRight.trailingAnchor.constraint(equalTo: fiveYrsBubble.trailingAnchor),
                
                //Five years text
                fiveYrsText.topAnchor.constraint(equalTo: fiveYrsBubble.topAnchor, constant: 10),
                fiveYrsText.leadingAnchor.constraint(equalTo: fiveYrsBubble.leadingAnchor, constant: 10),
                fiveYrsText.trailingAnchor.constraint(equalTo: fiveYrsBubble.trailingAnchor, constant: -10),
                fiveYrsText.bottomAnchor.constraint(equalTo: fiveYrsBubble.bottomAnchor, constant: -10),
                
                //Custom curve for two years bubble
                curveTop.bottomAnchor.constraint(equalTo: twoYrsBubble.topAnchor, constant: 2),
                curveTop.leadingAnchor.constraint(equalTo: twoYrsIcon.trailingAnchor, constant: 20),
                
                //Two years bubble
                twoYrsBubble.topAnchor.constraint(equalTo: twoYrsIcon.bottomAnchor, constant: 5),
                twoYrsBubble.leadingAnchor.constraint(equalTo: leading),
                twoYrsBubble.trailingAnchor.constraint(equalTo: trailing),
                
                //Two years text
                twoYrsText.topAnchor.constraint(equalTo: twoYrsBubble.topAnchor, constant: 10),
                twoYrsText.leadingAnchor.constraint(equalTo: twoYrsBubble.leadingAnchor, constant: 10),
                twoYrsText.trailingAnchor.constraint(equalTo: twoYrsBubble.trailingAnchor, constant: -10),
                twoYrsText.bottomAnchor.constraint(equalTo: twoYrsBubble.bottomAnchor, constant: -10),
                
                //One year bubble
                oneYearBubble.topAnchor.constraint(equalTo: oneYearIcon.centerYAnchor),
                oneYearBubble.leadingAnchor.constraint(equalTo: oneYearIcon.trailingAnchor, constant: 35),
                oneYearBubble.trailingAnchor.constraint(equalTo: trailing),
                
                //One year text
                oneYearText.topAnchor.constraint(equalTo: oneYearBubble.topAnchor, constant: 10),
                oneYearText.leadingAnchor.constraint(equalTo: oneYearBubble.leadingAnchor, constant: 10),
                oneYearText.trailingAnchor.constraint(equalTo: oneYearBubble.trailingAnchor, constant: -10),
                oneYearText.bottomAnchor.constraint(equalTo: oneYearBubble.bottomAnchor, constant: -10),
                
                //Custom curve for one year bubble
                curveLeft.topAnchor.constraint(equalTo: oneYearIcon.centerYAnchor),
                curveLeft.leadingAnchor.constraint(equalTo: oneYearBubble.leadingAnchor, constant: -4),
                
            ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 45)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 45)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 12)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 4
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 18)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 12)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 4
            
            fiveYrsText.font = UIFont(name: "Nunito-Bold", size: 9)
            
            twoYrsText.font = UIFont(name: "Nunito-Bold", size: 9)
            
            oneYearText.font = UIFont(name: "Nunito-Bold", size: 9)
            
            NSLayoutConstraint.activate([
            
                //Contact Button 1st
                contactButtonI.widthAnchor.constraint(equalToConstant: 70),
                contactButtonI.heightAnchor.constraint(equalToConstant: 25),
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Contact Button 2nd
                contactButtonII.widthAnchor.constraint(equalToConstant: 70),
                contactButtonII.heightAnchor.constraint(equalToConstant: 25),
                
                //Career View
                careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                careerGoalsView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
                
                //Chart image
                chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
                chartView.bottomAnchor.constraint(equalTo: careerGoalsView.bottomAnchor),
                chartView.widthAnchor.constraint(equalToConstant: 260),
                chartView.heightAnchor.constraint(equalToConstant: 450),
                
                //Five years icon
                fiveYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 44),
                fiveYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -36),
                fiveYrsIcon.widthAnchor.constraint(equalToConstant: 65),
                fiveYrsIcon.heightAnchor.constraint(equalToConstant: 25),
                
                //Two years icon
                twoYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 172),
                twoYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -103),
                twoYrsIcon.widthAnchor.constraint(equalToConstant: 65),
                twoYrsIcon.heightAnchor.constraint(equalToConstant: 25),
                
                //One year icon
                oneYearIcon.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -125),
                oneYearIcon.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: -8),
                oneYearIcon.widthAnchor.constraint(equalToConstant: 65),
                oneYearIcon.heightAnchor.constraint(equalToConstant: 25),
            ])
            
        } else if DeviceType.isIphone6or7or8 {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 50)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 50)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            fiveYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            twoYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            oneYearText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6) + 20),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Career View
                careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 10 )),
                careerGoalsView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9) - 5),
            
                //Chart image
                chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
                chartView.bottomAnchor.constraint(equalTo: careerGoalsView.bottomAnchor),
                chartView.widthAnchor.constraint(equalToConstant: 315),
                chartView.heightAnchor.constraint(equalToConstant: 540),
                
                //Five years icon
                fiveYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 52),
                fiveYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -40),
                fiveYrsIcon.widthAnchor.constraint(equalToConstant: 70),
                fiveYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //Two years icon
                twoYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 206),
                twoYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -121),
                twoYrsIcon.widthAnchor.constraint(equalToConstant: 70),
                twoYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //One year icon
                oneYearIcon.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -150),
                oneYearIcon.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 3),
                oneYearIcon.widthAnchor.constraint(equalToConstant: 70),
                oneYearIcon.heightAnchor.constraint(equalToConstant: 30),
    
            ])
            
        } else if DeviceType.isIphone6or7or8Plus {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 60)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            fiveYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            twoYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            oneYearText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6) + 20),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Career View
                careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) + 20)),
                careerGoalsView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.9)),
            
                //Chart image
                chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
                chartView.bottomAnchor.constraint(equalTo: careerGoalsView.bottomAnchor),
                chartView.widthAnchor.constraint(equalToConstant: 350),
                chartView.heightAnchor.constraint(equalToConstant: 600),
                
                //Five years icon
                fiveYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 60),
                fiveYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -43),
                fiveYrsIcon.widthAnchor.constraint(equalToConstant: 80),
                fiveYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //Two years icon
                twoYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 231),
                twoYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -134),
                twoYrsIcon.widthAnchor.constraint(equalToConstant: 80),
                twoYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //One year icon
                oneYearIcon.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -168),
                oneYearIcon.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 2),
                oneYearIcon.widthAnchor.constraint(equalToConstant: 80),
                oneYearIcon.heightAnchor.constraint(equalToConstant: 30),

                
            ])
            
        } else if DeviceType.isIphoneXorLater {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 60)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            fiveYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            twoYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            oneYearText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.6)),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Career View
                careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.7) + 50)),
                careerGoalsView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
            
                //Chart image
                chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
                chartView.bottomAnchor.constraint(equalTo: careerGoalsView.bottomAnchor),
                chartView.widthAnchor.constraint(equalToConstant: 350),
                chartView.heightAnchor.constraint(equalToConstant: 600),
                
                //Five years icon
                fiveYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 60),
                fiveYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -43),
                fiveYrsIcon.widthAnchor.constraint(equalToConstant: 80),
                fiveYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //Two years icon
                twoYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 231),
                twoYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -134),
                twoYrsIcon.widthAnchor.constraint(equalToConstant: 80),
                twoYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //One year icon
                oneYearIcon.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -168),
                oneYearIcon.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 2),
                oneYearIcon.widthAnchor.constraint(equalToConstant: 80),
                oneYearIcon.heightAnchor.constraint(equalToConstant: 30),

                
            ])
            
        } else if DeviceType.isIphoneXsMaxorLater {
            
            titlePartI.font = UIFont(name: "Nunito-Black", size: 60)
            titlePartII.font = UIFont(name: "Nunito-Black", size: 60)
            
            contactButtonI.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonI.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 20)
            
            contactButtonII.titleLabel?.font = UIFont(name: "Nunito-Black", size: 18)
            contactButtonII.layer.cornerRadius = contactButtonI.frame.size.height / 3
            
            fiveYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            twoYrsText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            oneYearText.font = UIFont(name: "Nunito-Bold", size: 12)
            
            NSLayoutConstraint.activate([
                
                //Title page
                titlePartI.topAnchor.constraint(equalTo: view.topAnchor, constant: (ConstraintsManager.height * 0.7) - 40),
                
                titlePartII.topAnchor.constraint(equalTo: titlePartI.bottomAnchor, constant: -20),
                
                //Career View
                careerGoalsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ((ConstraintsManager.height * 0.8) - 20)),
                careerGoalsView.heightAnchor.constraint(equalToConstant: (ConstraintsManager.height * 0.8) + 40),
            
                //Chart image
                chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
                chartView.bottomAnchor.constraint(equalTo: careerGoalsView.bottomAnchor),
                chartView.widthAnchor.constraint(equalToConstant: 400),
                chartView.heightAnchor.constraint(equalToConstant: 700),
                
                //Five years icon
                fiveYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 73),
                fiveYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -47),
                fiveYrsIcon.widthAnchor.constraint(equalToConstant: 80),
                fiveYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //Two years icon
                twoYrsIcon.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 272),
                twoYrsIcon.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -151),
                twoYrsIcon.widthAnchor.constraint(equalToConstant: 80),
                twoYrsIcon.heightAnchor.constraint(equalToConstant: 30),
                
                //One year icon
                oneYearIcon.bottomAnchor.constraint(equalTo: chartView.bottomAnchor, constant: -198),
                oneYearIcon.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 17),
                oneYearIcon.widthAnchor.constraint(equalToConstant: 80),
                oneYearIcon.heightAnchor.constraint(equalToConstant: 30),
                
            ])
        }
        
        //Adding button's action
        contactButtonI.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
        contactButtonII.addTarget(self, action: #selector(pullContactView), for: .touchUpInside)
    }
    
    
    //MARK: pulling contact view
    @objc func pullContactView() {
        
        let vc = ContactsSheetViewController()
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 15
        }
        soundClick()
        contactButtonAnimation()
        feedbackGenerator.impactOccurred()
        UIView.animate(withDuration: 0.75, delay: 1.0) {
            self.present(vc, animated: true)
        }
    }
    
    //MARK: Animations
    func titleAnimation() {
        
        UIView.animate(withDuration: 0.75) {
            self.titlePartI.alpha = 1
            self.titlePartI.frame.origin.x += 15
        } completion: { (done) in
            UIView.animate(withDuration: 1.0) {
                self.titlePartII.alpha = 1
                self.titlePartII.frame.origin.x += 15
                self.titlePartI.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
                self.titlePartII.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
            }
        }
    }
    
    func showButtonAnimation() {
        UIView.animate(withDuration: 1.0) {
            self.contactButtonI.alpha = 0
            self.contactButtonII.alpha = 1
            
        }
    }
    
    func hideButtonAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.contactButtonI.alpha = 1
            self.contactButtonII.alpha = 0
        }
    }
    
    func contactButtonAnimation() {
        
        if contactButtonII.alpha == 1 {
                    self.contactButtonII.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                } else {
                    self.contactButtonI.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }
                
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: [.curveLinear]) {
                    self.contactButtonI.transform = .identity
                    self.contactButtonII.transform = .identity
                }
        
    }
    
    
    func fiveYrsAnimation() {
        
        
        self.fiveYrsBubble.isHidden = false
        self.curveTopRight.isHidden = false
        self.curveTopRight.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.fiveYrsBubble.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            self.curveTopRight.transform = .identity
            self.fiveYrsBubble.transform = .identity
            self.fiveYrsBubble.alpha = 1
            self.curveTopRight.alpha = 1
        }
    }
    
    func twoYrsAnimation() {
        self.twoYrsBubble.isHidden = false
        self.curveTop.isHidden = false
        self.curveTop.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.twoYrsBubble.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            self.curveTop.transform = .identity
            self.twoYrsBubble.transform = .identity
            self.twoYrsBubble.alpha = 1
            self.curveTop.alpha = 1
        }
    }
    
    func oneYearAnimation() {
        self.oneYearBubble.isHidden = false
        self.curveLeft.isHidden = false
        self.curveLeft.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        self.oneYearBubble.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2) {
            self.curveLeft.transform = .identity
            self.oneYearBubble.transform = .identity
            self.oneYearBubble.alpha = 1
            self.curveLeft.alpha = 1
        }
    }
    
    
    
    //MARK: Sound effects
    
    func soundeffect() {
        guard let url = Bundle.main.url(forResource: "pop-up", withExtension: ".wav") else { return print("sound not found") }
        
        do {
            bubbleEffect = try AVAudioPlayer(contentsOf: url)
            bubbleEffect?.volume = 0.3
            bubbleEffect?.prepareToPlay()
            bubbleEffect?.play()
        } catch {
            print("Error trying to play the sound \(error.localizedDescription)")
        }
    }
    
    
    private func prepareSoundEffect() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: ".wav") else { return }
        
        do {
            click = try AVAudioPlayer(contentsOf: url)
            click?.volume = 0.3
            click?.prepareToPlay()
        } catch {
            print("Error trying to prepare sound click \(error.localizedDescription)")
        }
    }
    
    private func soundClick() {
        
        if let player = click {
            if player.isPlaying {
                player.currentTime = 0
            } else {
                player.play()
            }
        }
    }
}

//MARK: Scrollview Delegate
extension CareerGoalsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeigt = scrollView.frame.size.height
        let contentViewHeigt = scrollView.contentSize.height
        let yOffset = scrollView.contentOffset.y
        
        let shouldAnimate: CGFloat = 10
        
        if yOffset + scrollViewHeigt + shouldAnimate >= contentViewHeigt {
            
            showButtonAnimation()
            buttonShowed = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                if !self.bubbleAnimatedOnce {
                    self.feedbackGenerator.prepare()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.oneYearAnimation()
                        self.feedbackGenerator.impactOccurred()
                        self.soundeffect()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.twoYrsAnimation()
                        self.feedbackGenerator.impactOccurred()
                        self.soundeffect()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.fiveYrsAnimation()
                        self.feedbackGenerator.impactOccurred()
                        self.soundeffect()
                    }
                    
                    self.bubbleAnimatedOnce = true
                }
            }
                
        } else {
            
            if self.buttonShowed {
                hideButtonAnimation()
            }
        }
    }
}

