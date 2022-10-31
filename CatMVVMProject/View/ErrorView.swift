//
//  ErrorView.swift
//  CatMVVMProject
//
//  Created by İbrahim Atmaca on 31.10.2022.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: - Property
    @ObservedObject var breedNetwork: BreedNetwork
    
    
    var body: some View {
        VStack {
            Text("🙀")
                .font(.system(size: 80))
            Text(breedNetwork.errorMessage ?? "")
            
            Button{
                breedNetwork.fetchAllBreeds() 
            }label: {
                Text("Try Again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedNetwork: BreedNetwork()
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
