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

struct MyCertificateModel {
    
    static let cetificateName: [String] = ["iOS App Development Bootcamp", "User Experience Essentials", "Web & Mobile Design"]
    
    static let school = "Udemy"
    
    static let date: [String] = ["October 2022", "October 2022", "March 2023"]
    
    static let iOSDevelopmentURL: String = "https://www.udemy.com/certificate/UC-439988f3-d583-4f05-ae0f-a5e5de2b4b2f/"
    
    static let webAndMobileURL: String = "https://www.udemy.com/certificate/UC-4d1806b9-6ecd-4966-8f97-9444a0b76bca/"
    
    static let userExperience: String = "https://www.udemy.com/certificate/UC-484cc9a3-b965-437f-a8c9-a20785e2290f/"
    
}

struct MySkillsModel {
    
    static let skills: [String] = ["APIs", "CocoaPods", "CoreData", "Firebase", "Figma", "Git", "GitHub", "JSON", "MVC", "MVVM", "Swift", "SwiftUI", "UIKit", "UI/UX Designer", "VIPER"]
    
    static let skillsLevel: [String] = ["Intermediate", "Intermediate", "Elementary", "Intermediate", "Intermediate", "Elementary", "Elementary",
                                                   "Intermediate", "Advanced", "Advanced", "Advanced", "Elementary", "Intermediate", "Intermediate", "Basic"]
    
}
