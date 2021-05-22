//
//  WidgetCreationView.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 30/03/2021.
//

import SwiftUI

struct WidgetCreationView: View {
    
    // Access the widgetFactory (ObservableObject) that has already been created by @StateObject in SwiftUINavDemoApp
    @EnvironmentObject var widgetFactory: WidgetFactory<Widget>
    
    @State private var fillColor = Color.blue
    @State private var lineColor = Color.black
    @State private var lineWidth: Double = 2.0
    @State private var price: Double = 5.0
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                WidgetSummaryView()
                Spacer()
                WidgetView(fillColor: $fillColor, lineColor: $lineColor, lineWidth: $lineWidth, price: $price)
                WidgetPropertiesView(fillColor: $fillColor, lineColor: $lineColor, lineWidth: $lineWidth, price: $price)
                CreateWidgetButton(fillColor: $fillColor, lineColor: $lineColor, lineWidth: $lineWidth, price: $price)
                ShowFactoryButton()  // ShowFactoryButton creates a NavigationLink to FactoryView
                
            }.padding()
        }
        
        // Using the .navigationViewStyle(StackNavigationViewStyle()) modifier fixes the following
        // non-fatal runtime error:
        //
        //      displayModeButtonItem is internally managed and not exposed for DoubleColumn style.
        //      Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.
        //
        // We see this error when navigating from FactoryView to WidgetDetailsView unless the StackNavigationViewStyle
        // is used.
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WidgetCreationView_Previews: PreviewProvider {

    static var previews: some View {
        let wf = WidgetFactory<SwiftUINavDemo.Widget>()
        wf.create(price: 4.3, color: Color.red, lineColor: Color.black, lineWidth: 4)
        wf.create(price: 9.1, color: Color.red, lineColor: Color.black, lineWidth: 4)
        wf.create(price: 10.6, color: Color.red, lineColor: Color.black, lineWidth: 4)

        return WidgetCreationView().environmentObject(wf)
    }
}

