//
//  ExperienceModel.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 13.10.2023.
//

import Foundation

/// `MyExperienceMode` is an enum representing diverse work experiences, each associated with a specific company.
enum MyExperienceModel: String {
    
    //MARK: Properties
    /// An array containing the names of all companies available in the enum.
    static let companies: [String] = ["Swissquote", "Malt", "Sky", "EccoSalva", "Arcor do Brasil", "Motiva Contact Center"]
    
    //MARK: Cases
    /// Cases representing each company along with its corresponding name.
    case swissquote = "Swissquote"
    case malt = "Malt"
    case sky = "Sky"
    case eccosalve = "EccoSalva"
    case arcor = "Arcor do Brasil"
    case motiva = "Motiva Contact Center"
    
    //MARK: Computed properties
    /// Computed property returning the role or position associated with each company.
    var position: String {
        switch self {
        case .swissquote:
            "Junior iOS Software Engineer"
        case .malt, .sky:
            "iOS Developer Freelancer"
        case .eccosalve:
             "Assistant"
        case .arcor:
            "Production"
        case .motiva:
            "Customer Care"
        }
    }
    
    /// Computed property returning a formatted string containing company name, location, and employment duration.
    var companiesNameLocationDate: String {
        switch self {
        case .swissquote:
            "Swissquote, Gland, Vaud, April 2024 - Present"
        case .malt:
            "Malt Freelancer, Lausanne, VD, Aug 2023 - Present"
        case .sky:
            "Sky Switzerland, Neuchâtel, VD, Sep 2023 · 1 mo"
        case .eccosalve:
            "EccoSalva, Lisbon, LIS, Nov 2019 - Jul 2022"
        case .arcor:
            "Arcor do Brasil, Campinas, SP, May 2018 - Feb 2019"
        case .motiva:
            "Motiva, Campinas, SP, Feb 2016 - Apr 2018"
        }
    }
    
    /// Computed property returning an array of tasks or responsibilities for each company.
    var tasks: [String] {
        switch self {
        case .swissquote:
            ["New features implementation on iOS app.", "iOS application maintenance.", "Improving existing iOS app."]
        case .malt, .sky:
            ["New features implementation on iOS app.", "iOS application maintenance.", "Improving existing iOS app."]
        case .eccosalve:
            ["Providing patient care.", "Administration of documents.", "Emergency transport."]
        case .arcor:
            ["Food production.", "Machine maintenance.", "Stock replenishment."]
        case .motiva:
            ["Customer's support.", "Transport of products support.", "Selling products."]
        }
    }
}
