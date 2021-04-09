//
//  WidgetPropertiesView.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 07/04/2021.
//

import SwiftUI

struct WidgetPropertiesView: View {
    
    @Binding var fillColor: Color
    @Binding var lineColor: Color
    @Binding var lineWidth: Double
    @Binding var price: Double
    
    var body: some View {
        
        VStack {
            HStack {
                ColorPicker("Fill", selection: $fillColor, supportsOpacity: false).frame(width:65, height: 40).padding(.trailing)
                ColorPicker("Stroke", selection: $lineColor, supportsOpacity: false).frame(width: 90, height: 40)
            }
            
            Slider(value: $lineWidth, in: 0...20, minimumValueLabel: Text("0"), maximumValueLabel: Text("20")) {}
                .padding()
            
            Text("Line width")
            
            Slider(value: $price, in: 1...100, minimumValueLabel: Text("1"), maximumValueLabel: Text("100")) {}
                .padding()
            
            Text("Price")
        }
    }
}

struct WidgetPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetPropertiesView(fillColor: Binding.constant(Color.blue),
                             lineColor: Binding.constant(Color.black),
                             lineWidth: Binding.constant(4),
                             price: Binding.constant(2.5))
    }
}
