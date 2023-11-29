//
//  EducationModel.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 13.10.2023.
//

import Foundation


/**
 `MyEducationModel` is an enum representing education experiences at different instituitions. It includes informations about the school's name, graduation status, and descriptions of the certificates obtained.
 
 #Example usage:
 ```
 let myEducation = MyEducationModel.londonAppBrewery
 
 print("School: \(myEducation.rawValue)")
 print("Graduation: \(myEducation.graduation)")
 print("Description: \(myEducation.description)")
 ```
 */
enum MyEducationModel: String {
    
    //MARK: Properties
    /// An array containing the names of education instituitions
    static let school: [String] = ["London App Brewery", "Zero To Mastery", "Proflight Escola de Aviação"]
    
    //MARK: Cases
    
    /// Represents education at London App Brewery.
    case londonAppBrewery = "London App Brewery"
    
    /// Represents education at Zero To Mastery.
    case zeroToMatery = "Zero To Mastery"
    
    /// Represents education at Proflight Escola de Aviação.
    case proflight = "Proflight Escola de Aviação"
    
    //MARK: Computed properties
    
    /// Returns a string indicating the graduation status. All cases return "Certificate Graduated".
    var graduation: String {
        switch self {
        case .londonAppBrewery, .zeroToMatery, .proflight:
            return "Certificate Graduated"
        }
    }
    
    /// Returns a string providing a brief description of the certificate obtained at each educational institution.
    var description: String {
        switch self {
        case .londonAppBrewery:
            return "Certificated to work as iOS Developer"
        case .zeroToMatery:
            return "Certificated to work as Web & Mobile Designer"
        case .proflight:
            return "Certificated to work in Brazilian Civil Aviation as Flight Attendant"
        }
    }
}

/// `MyCertificateModel` is an enum representing various courses certificates.
enum MyCertificateModel: String {
    // MARK: Certificate Names
        
    /// Certificate names for different courses.
    static let cetificateName: [String] = ["Level Up in Swift", "Level Up in Auto Layout - Swift", "iOS Animations", "iOS App Development Bootcamp", "User Experience Essentials", "Web & Mobile Design"]
    
    //MARK: Cases
    
    /// Certificate case for the "Level Up in Swift" course.
    case levelUpinSwift = "Level Up in Swift"
    
    /// Certificate case for the "Level Up in Auto Layout - Swift" course.
    case levelUpinAutoLayout = "Level Up in Auto Layout - Swift"
    
    /// Certificate case for the "iOS Animations" course.
    case iOSAnimations = "iOS Animations"
    
    /// Certificate case for the "iOS App Development Bootcamp" course.
    case iOSAppDevelopment = "iOS App Development Bootcamp"
    
    /// Certificate case for the "User Experience Essentials" course.
    case userExperience = "User Experience Essentials"
    
    /// Certificate case for the "Web & Mobile Design" course.
    case webMobileDesign = "Web & Mobile Design"
    
    
    // MARK: Certificate Properties
        
    /// URL link for each certificate.
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
    
    /// Issue dates for each certificate.
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
    
    /// School or platform where the courses were taken.
    var school: String {
        switch self {
        case .levelUpinSwift, .levelUpinAutoLayout, .iOSAnimations, .iOSAppDevelopment, .userExperience, .webMobileDesign:
            return "Udemy"
        }
    }
}

/// `MySkillsModel` is an enum representing a model containing all the owner's skills related to iOS App Development
enum MySkillsModel: String {
    
    //MARK: Properties
    
    /// An array containing all available skills.
    static let skills: [String] = ["APIs", "CocoaPods", "CoreData", "Firebase", "Figma", "Git", "GitHub", "iOS Animations", "JSON", "MVC", "MVVM", "Swift", "SwiftUI", "UIKit", "UI/UX Designer", "VIPER"]
    
    //MARK: Cases
    
    /// Cases representing individual skills.
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
    
    //MARK: Computed properties
    
    /// Computed property representing the skill level based on the skill category.
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

