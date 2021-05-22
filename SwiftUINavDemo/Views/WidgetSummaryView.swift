//
//  WidgetSummaryView.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 07/04/2021.
//

import SwiftUI

struct WidgetSummaryView: View {
    
    // Access the widgetFactory (ObservableObject) that has already been created by @StateObject in SwiftUINavDemoApp
    @EnvironmentObject var widgetFactory: WidgetFactory<Widget>
    
    var body: some View {
        
        Text("Total widgets: \(widgetFactory.inventory.count) (\(Widget.formatCurrencyString(value: widgetFactory.inventoryValue())))")
            .font(.title2)
    }
}

struct WidgetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let wf = WidgetFactory<SwiftUINavDemo.Widget>()
        wf.create(price: 4.3, color: Color.red, lineColor: Color.black, lineWidth: 4)
        wf.create(price: 9.1, color: Color.red, lineColor: Color.black, lineWidth: 4)
        wf.create(price: 10.6, color: Color.red, lineColor: Color.black, lineWidth: 4)

        return WidgetSummaryView().environmentObject(wf)
    }
}
