//
//  AdaptativeConstraints.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 10.10.2023.
//

import UIKit


enum iPhoneModel {
    case iPhone
    case iPhoneSE
    case iPhonePlus
    
    var contactButtonConstraints: Int {
        
        switch self {
        case .iPhoneSE:
            return 10
        case .iPhone, .iPhonePlus:
            return 40
        }
    }
    
    var customViewConstraints: CGFloat {
        
        switch self {
        case .iPhoneSE:
            return UIScreen.main.bounds.height * 8
        case .iPhone:
            return UIScreen.main.bounds.height * 7
        case .iPhonePlus:
            return UIScreen.main.bounds.height * 7
        }
    }
}

