//
//  EducationModel.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 13.10.2023.
//

import Foundation

struct MyEducationModel {
    
    static let school: [String] = ["London App Brewery", "Zero To Mastery", "Proflight Escola de Aviação"]
    
    static let graduation = "Certicate graduated"
    
    static let description: [String] = ["Certificated to work as iOS Developer", "Certificated to work as Web & Mobile Designer", "Certificated to work in Brazilian Civil Aviation as Flight Attendant"]
    
}

enum MyEducation: String {
    case londonAppBrewery = "London App Brewery"
    case zeroToMatery = "Zero To Mastery"
    case proflight = "Proflight Escola de Aviação"
    
    var graduation: String {
        switch self {
        case .londonAppBrewery, .zeroToMatery, .proflight:
            return "Certificate Graduated"
        }
    }
    
    var description: String {
        switch self {
        case .londonAppBrewery:
            return "Certificated to work as iOS Developer"
        case .zeroToMatery:
            return "Zero To Mastery"
        case .proflight:
            return "Certificated to work in Brazilian Civil Aviation as Flight Attendant"
        }
    }
}

struct MyCertificateModel {
    
    static let cetificateName: [String] = ["Level Up in Swift", "Level Up in Auto Layout - Swift", "iOS Animations", "iOS App Development Bootcamp", "User Experience Essentials", "Web & Mobile Design"]
    
    static let school = "Udemy"
    
    static let date: [String] = ["November 2023", "October 2023", "October 2023", "March 2023" , "October 2022", "October 2022"]
    
    static let LevelUpSwift: String = "https://ude.my/UC-fc31ba51-469d-4045-a24f-f75c6989c4b4/"
    
    static let iOSAutoLayoutURL: String = "https://ude.my/UC-ea1d2fea-5a0d-4691-8aa6-c9d8d315a58d/"
    
    static let iOSAnimationURL: String = "https://ude.my/UC-0c96e837-69d3-471f-95d6-d0351594fe4b/"
    
    static let iOSDevelopmentURL: String = "https://www.udemy.com/certificate/UC-439988f3-d583-4f05-ae0f-a5e5de2b4b2f/"
    
    static let webAndMobileURL: String = "https://www.udemy.com/certificate/UC-4d1806b9-6ecd-4966-8f97-9444a0b76bca/"
    
    static let userExperience: String = "https://www.udemy.com/certificate/UC-484cc9a3-b965-437f-a8c9-a20785e2290f/"
    
}

enum MyCertificates: String {
    case levelUpinSwift = "Level Up in Swift"
    case levelUpinAutoLayout = "Level Up in Auto Layout - Swift"
    case iOSAnimations = "iOS Animations"
    case iOSAppDevelopment = "iOS App Development Bootcamp"
    case userExperience = "User Experience Essentials"
    case webMobileDesign = "Web & Mobile Design"
    
    var linkURL: String {
        switch self {
        case .levelUpinSwift:
            return "https://ude.my/UC-fc31ba51-469d-4045-a24f-f75c6989c4b4/"
        case .levelUpinAutoLayout:
            return "https://ude.my/UC-ea1d2fea-5a0d-4691-8aa6-c9d8d315a58d/"
        case .iOSAnimations:
            return "https://ude.my/UC-0c96e837-69d3-471f-95d6-d0351594fe4b/"
        case .iOSAppDevelopment:
            return "https://www.udemy.com/certificate/UC-439988f3-d583-4f05-ae0f-a5e5de2b4b2f/"
        case .userExperience:
            return "https://www.udemy.com/certificate/UC-484cc9a3-b965-437f-a8c9-a20785e2290f/"
        case .webMobileDesign:
            return "https://www.udemy.com/certificate/UC-4d1806b9-6ecd-4966-8f97-9444a0b76bca/"
        }
    }
    
    var dates: String {
        switch self {
        case .levelUpinSwift:
            return "November 2023"
        case .levelUpinAutoLayout, .iOSAnimations:
            return "October 2023"
        case .iOSAppDevelopment:
            return "March 2023"
        case .userExperience, .webMobileDesign:
            return "October 2022"
        }
    }
    
    var school: String {
        switch self {
        case .levelUpinSwift, .levelUpinAutoLayout, .iOSAnimations, .iOSAppDevelopment, .userExperience, .webMobileDesign:
            return "Udemy"
        }
    }
}

struct MySkillsModel {
    
    static let skills: [String] = ["APIs", "CocoaPods", "CoreData", "Firebase", "Figma", "Git", "GitHub", "iOS Animations", "JSON", "MVC", "MVVM", "Swift", "SwiftUI", "UIKit", "UI/UX Designer", "VIPER"]
    
    static let skillsLevel: [String] = ["Intermediate", "Intermediate", "Elementary", "Intermediate", "Intermediate", "Elementary", "Elementary", "Elementary",
                                                   "Intermediate", "Advanced", "Advanced", "Advanced", "Elementary", "Intermediate", "Intermediate", "Basic"]
    
}

enum MySkills: String {
    case api = "APIs"
    case autoLayout = "Auto Layout"
    case cocoaPods = "CocoaPods"
    case coreData = "CoreData"
    case firebase = "Firebase"
    case figma = "Figma"
    case git = "Git"
    case gitHub = "GitHub"
    case iOSAnimation = "iOS Animations"
    case JSON = "JSON"
    case MVC = "MVC"
    case MVVM = "MVVM"
    case swift = "Swift"
    case swiftUI = "SwiftUI"
    case uikit = "UIKit"
    case uiuxDesign = "UI/UX Designer"
    case VIPER = "VIPER"
    
    
    var level: String {
        switch self {
        case .VIPER:
            return "Basic"
        case .coreData, .git, .gitHub, .iOSAnimation, .swiftUI:
            return "Elementary"
        case .api, .cocoaPods, .firebase, .figma, .JSON, .uikit, .uiuxDesign:
            return "Intermediate"
        case .autoLayout, .MVC, .MVVM, .swift:
            return "Advanced"
        }
    }
 
}
