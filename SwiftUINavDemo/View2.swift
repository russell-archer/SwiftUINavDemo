//
//  View2.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 30/03/2021.
//

import SwiftUI

struct View2: View {
    var body: some View {
        
        NavigationLink(destination: View3()) {
            Text("Goto View3")
        }
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
