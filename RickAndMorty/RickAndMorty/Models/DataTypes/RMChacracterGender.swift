//
//  RMChacracterGender.swift
//  RickAndMorty
//
//  Created by Macbook on 21/02/2023.
//

import Foundation

enum RMCharacterGender: String, Codable {
    // ('Female', 'Male', 'Genderless' or 'unknown')
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
