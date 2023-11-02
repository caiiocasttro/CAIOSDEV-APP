//
//  ExperienceModel.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 13.10.2023.
//

import Foundation

struct MyExperienceModel {
    
    static let companies: [String] = ["Sky Switzerland, Neuchâtel, VD, Sep 2023 · 1 mo", "EccoSalva, Lisbon, LIS, 11/2019 - 07/2022", "Arcor do Brasil, Campinas, SP, May 2018 - Feb 2019", "Motiva, Campinas, SP, Feb 2016 - Apr 2018"]
    
    static let position: [String] = ["iOS Developer Freelancer", "Assistant", "Production", "Customer Care"]
    
    static let date: [String] = ["Sep 2023 · 1 mo", "Nov 2019 - Jul 2022", "May 2018 - Feb 2019", "Feb 2016 - Apr 2018"]
    
    static let malt: [String] = ["New features implementation on iOS app.", "iOS application maintenance.", "Building projects"]
    
    static let skySwitzerland: [String] = ["New features implementation on iOS app.", "iOS application maintenance.", "Improving existing iOS app."]
    
    static let eccosalva: [String] = ["Providing patient care.", "Administration of documents.", "Emergency transport."]
    
    static let arcor: [String] = ["Food production.", "Machine maintenance.", "Stock replenishment."]
    
    static let motiva: [String] = ["Customer's support.", "Transport of products support.", "Selling products."]
    
    
}

enum MyExperience: String {
    case malt = "Malt"
    case sky = "Sky"
    case eccosalve = "EccoSalva"
    case arcor = "Arcor do Brasil"
    case motiva = "Motiva Contact Center"
    
    var companiesName: String {
        switch self {
        case .malt:
            return "Malt Freelancer"
        case .sky:
            return "Sky Switzerland"
        case .eccosalve:
            return "EccoSalva"
        case .arcor:
            return "Arcor do Brasil"
        case .motiva:
            return "Motiva"
        }
    }
    
    var location: String {
        switch self {
        case .malt:
            return "Lausanne, VD"
        case .sky:
            return "Neuchâtel, VD"
        case .eccosalve:
            return "Lisbon, LIS"
        case .arcor, .motiva:
            return "Campinas, SP"
            
        }
    }
    
    var date: String {
        switch self {
        case .malt:
            return "Aug 2023 - Present"
        case .sky:
            return "Sep 2023 · 1 mo"
        case .eccosalve:
            return "Nov 2019 - Jul 2022"
        case .arcor:
            return "May 2018 - Feb 2019"
        case .motiva:
            return "Feb 2016 - Apr 2018"
        }
    }
    
    var postion: [String] {
        switch self {
            
        case .malt, .sky:
            return ["New features implementation on iOS app.", "iOS application maintenance.", "Improving existing iOS app."]
        case .eccosalve:
            return ["Providing patient care.", "Administration of documents.", "Emergency transport."]
        case .arcor:
            return ["Food production.", "Machine maintenance.", "Stock replenishment."]
        case .motiva:
            return ["Customer's support.", "Transport of products support.", "Selling products."]
        }
    }
}
