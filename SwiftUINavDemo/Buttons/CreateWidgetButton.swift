//
//  CreateWidgetButton.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 07/04/2021.
//

import SwiftUI

struct CreateWidgetButton: View {
    @Binding var fillColor: Color
    @Binding var lineColor: Color
    @Binding var lineWidth: Double
    @Binding var price: Double
    
    // Access the widgetFactory (ObservableObject) that has already been created by @StateObject in SwiftUINavDemoApp
    @EnvironmentObject var widgetFactory: WidgetFactory<Widget>
    
    var body: some View {
        Button(action: {
            widgetFactory.create(price: price, color: fillColor, lineColor: lineColor, lineWidth: Int(lineWidth))
            
        }, label: {
            Text("Create Widget")
                .font(.title)
                .foregroundColor(.white)
                .padding(30)
                .frame(width: 250, height: 100, alignment: .center)
                .background(Color(.blue))
                .cornerRadius(10)
        })
        .padding(25)
    }
}

struct CreateWidgetButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateWidgetButton(fillColor: Binding.constant(Color.blue),
                           lineColor: Binding.constant(Color.black),
                           lineWidth: Binding.constant(4),
                           price: Binding.constant(2.5))
    }
}
