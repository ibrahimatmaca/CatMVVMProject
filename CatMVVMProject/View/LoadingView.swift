//
//  LoadingView.swift
//  CatMVVMProject
//
//  Created by İbrahim Atmaca on 31.10.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 10){
            Text("😹")
            ProgressView()
                .frame(width: 50 ,height: 50)
            Text("Getting the cats..")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
