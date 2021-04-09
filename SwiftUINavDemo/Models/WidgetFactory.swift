//
//  WidgetFactory.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 03/04/2021.
//

import SwiftUI

// `WidgetFactory` is a generic class used to create any type of car that
// conforms to `WidgetProtocol`. `T: WidgetProtocol` is a simple type constraint
// that states that the `WidgetFactory` takes a type parameter that is
// any type that that conforms to `WidgetProtocol`.
class WidgetFactory<T: WidgetProtocol>: ObservableObject {
    
    @Published var inventory: [T] = []
    
    func create(price: Double, color: Color, lineColor: Color, lineWidth: Int) {
        let newWidget = T(price: price, color: color, lineColor: lineColor, lineWidth: lineWidth)
        inventory.append(newWidget)
    }
    
    func remove(id: UUID) {
        guard let i = inventory.firstIndex(where: { $0.id == id }) else { return }
        
        inventory.remove(at: i)
    }
    
    func inventoryValue() -> Double { inventory.reduce(0) { $0 + $1.price }}
}
