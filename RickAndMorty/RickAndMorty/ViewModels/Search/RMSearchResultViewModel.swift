//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Macbook on 08/03/2023.
//

import Foundation

//

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
