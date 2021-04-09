//
//  WidgetView.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 07/04/2021.
//

import SwiftUI

struct WidgetView: View {
    
    @Binding var fillColor: Color
    @Binding var lineColor: Color
    @Binding var lineWidth: Double
    @Binding var price: Double
    
    var body: some View {
        
        Circle()
            .fill(fillColor)
            .overlay(Circle().stroke(lineColor, lineWidth: CGFloat(lineWidth)))
            .overlay(Text(Widget.formatCurrencyString(value: price)).font(.title2))
            .frame(width: 150, height: 150)
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(fillColor: Binding.constant(Color.blue),
                   lineColor: Binding.constant(Color.green),
                   lineWidth: Binding.constant(10),
                   price: Binding.constant(20.5))
    }
}
