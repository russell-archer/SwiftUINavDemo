//
//  Widget.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 03/04/2021.
//

import SwiftUI

protocol WidgetProtocol: Identifiable {
    
    var id: UUID { get }
    var price: Double { get set }
    var color: Color { get set }
    var lineColor: Color { get set }
    var lineWidth: Int { get set }
    
    init(price: Double, color: Color, lineColor: Color, lineWidth: Int)
    
}

struct Widget: WidgetProtocol {
    
    let id = UUID()
    var price: Double
    var color: Color
    var lineColor: Color
    var lineWidth: Int
    
    init(price: Double, color: Color, lineColor: Color, lineWidth: Int) {
        self.price = price
        self.color = color
        self.lineColor = lineColor
        self.lineWidth = lineWidth
    }
    
    static func formatCurrencyString(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        return formatter.string(from: NSNumber(value: value)) ?? "$0"
    }
}
