//
//  ShowFactoryButton.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 07/04/2021.
//

import SwiftUI

struct ShowFactoryButton: View {
    var body: some View {
        
        NavigationLink(destination: FactoryView()) {
            Text("Show Factory")
                .font(.title)
                .foregroundColor(.white)
                .padding(30)
                .frame(width: 250, height: 100, alignment: .center)
                .background(Color(.blue))
                .cornerRadius(10)
        }
        .navigationTitle("Widget Creation")
    }
}

struct ShowFactoryButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowFactoryButton()
    }
}
