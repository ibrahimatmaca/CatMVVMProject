//
//  BreedNetwork.swift
//  CatMVVMProject
//
//  Created by İbrahim Atmaca on 31.10.2022.
//

import Foundation

class BreedNetwork: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
           self.service = service
           fetchAllBreeds()
       }
    
    func fetchAllBreeds() {
            
            isLoading = true
            errorMessage = nil
            
            let url = URL(string: "https://api.thecatapi.com/v1/breeds")
            service.fetchBreeds(url: url) { [unowned self] result in
                
                DispatchQueue.main.async {
                    
                    self.isLoading = false
                    switch result {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        // print(error.description)
                        print(error)
                    case .success(let breeds):
                        print("--- sucess with \(breeds.count)")
                        self.breeds = breeds
                    }
                }
            }
            
        }
        
        //MARK: preview helpers
        
        static func errorState() -> BreedNetwork {
            let fetcher = BreedNetwork()
            fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
            return fetcher
        }
        
        static func successState() -> BreedNetwork {
            let fetcher = BreedNetwork()
            fetcher.breeds = [Breed.example1(), Breed.example2()]
            
            return fetcher
        }
    
    
}
