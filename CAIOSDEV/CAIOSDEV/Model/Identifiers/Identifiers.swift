//
//  Identifiers.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 10.10.2023.
//

import Foundation

/// `tabBarSegue` is an enum representing the segue identifier related to the main tabBar view.
enum tabBarSegue: String {
    case main = "tabBarSegue"
}

/// `AboutMeIdentifiers` is an enum  representing cell identifiers for the About Me page.
enum AboutMeIdentifiers: String {
    case main = "AboutMeViewCell"
    case Languages = "LanguagesViewCell"
    case Location = "LocationViewCell"
}

/// `EducationIdentifiers` is an enum  representing cell identifiers for the Education page.
enum EducationIdentifiers: String {
    case educationTitle = "MyEducationViewCell"
    case education = "EducationViewCell"
    case certificate = "CertificateViewCell"
    case title = "MyCertificatesViewCell"
    case skills = "SkillsViewCell"
}

/// `ExperienceIdentifiers` is an enum  representing cell identifier for the Experience page.
enum ExperienceIdentifiers: String {
    case main = "ExperienceViewCell"
}

/// `PassionsIdentifier` is an enum  representing cell identifier for the Passions page.
enum PassionsIdentifier: String {
    case main = "PassionsViewCell"
}

