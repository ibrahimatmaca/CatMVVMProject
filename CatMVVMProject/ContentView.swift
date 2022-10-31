//
//  ContentView.swift
//  CatMVVMProject
//
//  Created by İbrahim Atmaca on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    @StateObject var breedNetwork = BreedNetwork()
    
    var body: some View {
        if breedNetwork.isLoading {
            LoadingView()
        }
        else if breedNetwork.errorMessage != nil {
            ErrorView(breedNetwork: breedNetwork)
        }
        else{
            BreedListView(breeds: breedNetwork.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
