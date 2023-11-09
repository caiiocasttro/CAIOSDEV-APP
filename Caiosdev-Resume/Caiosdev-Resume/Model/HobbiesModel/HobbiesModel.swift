//
//  HobbiesModel.swift
//  Caiosdev-Resume
//
//  Created by Caio Chaves on 13.10.2023.
//

import Foundation

enum HobbiesModel: String {
    
    static let pictures: [String] = ["coding", "model", "travelling", "best", "explore", "roller"]
    
    case coding = "coding"
    case model = "model"
    case travelling = "travelling"
    case best = "best"
    case explore = "explore"
    case roller = "roller"
    
    var phrase: String {
        switch self {
        case .coding:
            return "I'm a coding enthusiast with a penchant for nature, turning bugs into features while surrounded by bugs at the park! 😎🌳"
        case .model:
            return "I'm a self-proclaimed model of mirth and pixels, striking a pose in the art of selfie-glamour and filter finesse! 📸🕺🏽"
        case .travelling:
            return "I'm like a GPS with a sense of humor—always taking detours and turning wrong ways into the scenic route of adventure! 🚤🤣"
        case .best:
            return "I'm the snap-happy sidekick, turning everyday moments into Instagram-worthy scenes, one friend at a time! 📸❤️"
        case .explore:
            return "I'm like a camera with a 'first impression' filter—snapping the perfect shot on my virgin visit to every place, leaving a trail of rookie brilliance! 🏞️🤳🏽"
        case .roller:
            return "I'm the wheely cool summer skater, rollin' with my pals and collecting sunshine and laughter on eight wheels! 🌞🛼"
        }
    }
    
    var date: String {
        switch self {
        case .coding:
            return "Oct 2023"
        case .model:
            return "April 2022"
        case .travelling:
            return "May 2023"
        case .best:
            return "April 2022"
        case .explore, .roller:
            return "Aug 2021"
        }
    }
    
}
