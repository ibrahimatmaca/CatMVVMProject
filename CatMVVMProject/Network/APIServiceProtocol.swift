//
//  APIServiceProtocol.swift
//  CatMVVMProject
//
//  Created by İbrahim Atmaca on 31.10.2022.
//

import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
