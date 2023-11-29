//
//  PassionsModel.swift
//  CAIOSDEV
//
//  Created by Caio Chaves on 13.10.2023.
//

import Foundation
/**
 `PassionsModel` Enum
  
 An enum representing different passions or interests along with associated information such as a description, picture filenames, and their order in a sequence.
 
 */
enum PassionsModel: String {
    
    //MARK: Properties
    /// An array containing filenames of pictures corresponding to each passion.
    static let pictures: [String] = ["coding", "model", "travelling", "best", "explore", "roller"]
    
    //MARK: Cases
    /// Cases representing the filenames of pictures
    case coding = "coding"
    case model = "model"
    case travelling = "travelling"
    case best = "best"
    case explore = "explore"
    case roller = "roller"
    
    //MARK: Computed properties
    /// A descriptive phrase associated with each passion.
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
    /// The sequence number of the picture associated with each passion.
    var picNumber: String {
        switch self {
        case .coding:
            return "1/6"
        case .model:
            return "2/6"
        case .travelling:
            return "3/6"
        case .best:
            return "4/6"
        case .explore:
            return "5/6"
        case .roller:
            return "6/6"
        }
    }
    
}
