//
//  Model.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 08.10.2023.
//

import Foundation

struct AboutMeModel {
    
    static let whoIam = "Brazilian tech enthusiast, embracing challenges, project growth, and human connections. Passionate about learning, especially in tech and aviation realms. 👨🏾‍💻❤️"
    
    static let lookingFor = "Eager for an iOS Developer role, bringing energy to teams, diving into exciting projects, and tackling career challenges head-on. Can't wait to make a mark!📱💡"
    
    static let languages = ["Portuguese", "English", "French"]
    
    static let location = "Lausanne, Switzerland"
    
}

struct CareerGoalsModel {
    
    static let identifier = "CareerGoalsViewCell"
    
    static let shortTerm = "Diving into projects, syncing with company goals, and personal aspirations. Thrilled for challenges, growth, and team support. Aim: Impact project success, nurture a culture of growth and triumph! 🚀🌱"
    
    static let midTerm = "Next 2-5 years: Bossing up to a senior role, guiding iOS newbies, and being the helpful wizard of the team. Sharing wisdom and high-fives – that's my gig. Need advice? I'm your iOS Yoda! 🌟📱"
    
    static let longTerm = "5+ years: Head of Development dreams! Pumped to elevate the team experience and create a thriving workplace. Big on studying and dropping game changing ideas. Also, spreading the tech love by coaching newbies and giving back to the community! 🚀🌟"
    
    static let initialSkills: [String] = ["Swift", "MVC", "MVVM", "VIPER", "UIKit", "SwiftUI", "CoreData",
                                    "Firebase", "JSON", "APIs", "CocoaPods", "Git", "GitHub", "UX/UI Design", "Figma"]
    
    static let skillsLevel: [String] = ["Advanced", "Advanced", "Advanced", "Beginner", "Intermediate", "Elementary", "Elementary",
                                                   "Intermediate", "Elementary", "Intermediate", "Intermediate", "Elementary", "Intermediate", "Intermediate", "Intermediate"]
    
}

struct MyEducationModel {
    
    static let school: [String] = ["London App Brewery", "Zero To Mastery", "Proflight Escola de Aviação"]
    
    static let graduation = "Certicate graduated"
    
    static let description: [String] = ["Certificated to work as iOS Developer", "Certificated to work as Web & Mobile Designer", "Certificated to work in Brazilian Civil Aviation as Flight Attendant"]
    
}

struct MyCertificateModel {
    
    static let cetificateName: [String] = ["iOS App Development Bootcamp", "User Experience Essentials", "Web & Mobile Design"]
    
    static let school = "Udemy"
    
    static let date: [String] = ["October 2022", "October 2022", "March 2023"]
    
}

struct MyExperienceModel {
    
    static let companies: [String] = ["Sky Switzerland", "EccoSalva", "Arcor do Brasil", "Motiva Contact Center"]
    
    static let position: [String] = ["iOS Developer Freelancer", "Assistant", "Production", "Customer Care"]
    
    static let date: [String] = ["Sep 2023 · 1 mo", "Nov 2019 - Jul 2022 · 2 yrs 9 mos", "May 2018 - Feb 2019 · 10 mos", "Feb 2016 - Apr 2018 · 2 yrs 3 mos"]
    
    static let skySwitzerland: [String] = ["New features implementation on iOS app.", "iOS application maintenance.", "Improving existing iOS app."]
    
    static let eccosalva: [String] = ["Providing patient care.", "Administration of documents.", "Emergency transport."]
    
    static let arcor: [String] = ["Food production.", "Machine maintenance.", "Stock replenishment."]
    
    static let motiva: [String] = ["Customer's support.", "Transport of products support.", "Selling products."]
    
}
