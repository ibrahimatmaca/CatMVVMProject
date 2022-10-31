//
//  BreedRow.swift
//  CatMVVMProject
//
//  Created by İbrahim Atmaca on 31.10.2022.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            
            //MARK: Photo
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize*1.2)
                            .clipped()
                        
                    } else if phase.error != nil {
                        
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize*1.2)
                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize*1.2)
                    }
                    
                }
            }
            else {
                Color.gray.frame(width: imageSize, height: imageSize*1.2)
            }
            
            //MARK: Name and Temperament
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.largeTitle)
                Text(breed.temperament)
            }
            
        }//:HStack
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.fixed(width: 400, height: 200))
            .padding()
    }
}
