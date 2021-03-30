//
//  ContentView.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 30/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            
            NavigationLink(destination: View2()) {
                Text("Goto View2")
            }
        }
        
        // Using the .navigationViewStyle(StackNavigationViewStyle()) modifier fixes the following
        // non-fatal runtime error:
        //
        //      displayModeButtonItem is internally managed and not exposed for DoubleColumn style.
        //      Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.
        //
        // We see this error when navigating from View2 to View3 unless the StackNavigationViewStyle
        // is used.
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
