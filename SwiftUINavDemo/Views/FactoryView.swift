//
//  FactoryView.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 30/03/2021.
//

import SwiftUI

struct FactoryView: View {
    
    // Access the widgetFactory (ObservableObject) that has already been created by @StateObject in SwiftUINavDemoApp
    @EnvironmentObject var widgetFactory: WidgetFactory<Widget>
    
    var body: some View {
        
        List(widgetFactory.inventory) { widget in
            WidgetView(fillColor: Binding.constant(widget.color),
                       lineColor: Binding.constant(widget.lineColor),
                       lineWidth: Binding.constant(Double(widget.lineWidth)),
                       price: Binding.constant(widget.price))
        }
    }
}

struct FactoryView_Previews: PreviewProvider {
    static var previews: some View {
        let wf = WidgetFactory<SwiftUINavDemo.Widget>()
        wf.create(price: 4.3, color: Color.red, lineColor: Color.black, lineWidth: 4)
        wf.create(price: 9.1, color: Color.blue, lineColor: Color.black, lineWidth: 10)
        wf.create(price: 10.6, color: Color.green, lineColor: Color.black, lineWidth: 0)
        
        return FactoryView().environmentObject(wf)
    }
}
