//
//  ExperienceModel.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 13.10.2023.
//

import Foundation

enum MyExperienceModel: String {
    
    static let companies: [String] = ["Malt", "Sky", "EccoSalva", "Arcor do Brasil", "Motiva Contact Center"]
    
    case malt = "Malt"
    case sky = "Sky"
    case eccosalve = "EccoSalva"
    case arcor = "Arcor do Brasil"
    case motiva = "Motiva Contact Center"
    
    var position: String {
        switch self {
        case .malt, .sky:
            return "iOS Developer Freelancer"
        case .eccosalve:
            return "Assistant"
        case .arcor:
            return "Production"
        case .motiva:
            return "Customer Care"
        }
    }
    
    var companiesNameLocationDate: String {
        switch self {
        case .malt:
            return "Malt Freelancer, Lausanne, VD, Aug 2023 - Present"
        case .sky:
            return "Sky Switzerland, Neuchâtel, VD, Sep 2023 · 1 mo"
        case .eccosalve:
            return "EccoSalva, Lisbon, LIS, Nov 2019 - Jul 2022"
        case .arcor:
            return "Arcor do Brasil, Campinas, SP, May 2018 - Feb 2019"
        case .motiva:
            return "Motiva, Campinas, SP, Feb 2016 - Apr 2018"
        }
    }
    
    var tasks: [String] {
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
