//
//  SwiftUINavDemoApp.swift
//  SwiftUINavDemo
//
//  Created by Russell Archer on 30/03/2021.
//

import SwiftUI

@main
struct SwiftUINavDemoApp: App {
    
    // Create shared model
    var widgetFactory = WidgetFactory<Widget>()
    
    var body: some Scene {
        WindowGroup {
            WidgetCreationView()
                .environmentObject(widgetFactory)  // Make available to all views
        }
    }
}
