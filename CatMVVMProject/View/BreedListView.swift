//
//  BreedListView.swift
//  CatMVVMProject
//
//  Created by İbrahim Atmaca on 31.10.2022.
//

import SwiftUI

struct BreedListView: View {
    
    // MARK: - Property
    let breeds: [Breed]
    @State private var searchText: String = ""
    
    //MARK: - Functions
    func filterBreeds()->[Breed]{
        if searchText.count == 0 {
            return breeds
        }
        else{
            return breeds.filter {$0.name.contains(searchText)}
        }
    }
    
    //MARK: - Content
    var body: some View {
        NavigationView {
            List {
                ForEach(filterBreeds()) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    }label: {
                        BreedRow(breed: breed)
                    }
                }
            }
        }//:NavigationView
        .listStyle(PlainListStyle())
        .navigationTitle("Find Your Perfect Cat 😻")
        .searchable(text: $searchText)
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
