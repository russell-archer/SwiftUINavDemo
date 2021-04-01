# SwiftUINavDemo
SwiftUI navigation demo

This app demonstrates the following:

- Navigation between multiple levels of views with a single NavigationView (avoiding multiple nav bars)
- Sharing data between views using @State, @StateObject and @EnvironmentObject

---

# Avoiding Multiple NavigationViews

Let's say you have three linked views:

![](./readme-assets/Avoiding Multiple NavigationViews 0.png)

The solution is simple: **remove** the `NavigationView` from child views (e.g. ListView in this example). 
This means that any `NavigationLink` in child view will use the parent's `NavigationView`:
 
 ```swift
 struct MainView: View {
    var body: some View {
        
        NavigationView {
            NavigationLink(destination: ListView()) {}
        }
    }
}

struct ListView: View {
    var body: some View {
        
        // Using parent's (MainView) NavigationView
        NavigationLink(destination: DetailView()) {}
    }
}

struct DetailView: View {
    var body: some View {
        
        // Using MainView's NavigationView
        Text("...")
        Text("...")
        Text("...")
    }
}
 ```
 
 If you use this approach then any `NavigationLink` in a child view will automatically use its parent's `NavigationView`:
 
 ![](./readme-assets/Avoiding Multiple NavigationViews 1.png)
 
 ## The navigationViewStyle Modifier
Note that the `.navigationViewStyle(StackNavigationViewStyle())` modifier fixes the following non-fatal runtime error:

```
displayModeButtonItem is internally managed and not exposed for DoubleColumn style.
Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.
```

We see this error when navigating from a child view to another child view unless the `StackNavigationViewStyle` is used.

Example:

```swift
struct ContentView: View {
    var body: some View {

        NavigationView {
            
            NavigationLink(destination: View2()) {
                Text("Goto View2")
            }
        }
        
        // Using the .navigationViewStyle(StackNavigationViewStyle()) modifier fixes the following
        // non-fatal runtime error:
        //
        //      displayModeButtonItem is internally managed and not exposed for DoubleColumn style.
        //      Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.
        //
        // We see this error when navigating from View2 to View3 unless the StackNavigationViewStyle
        // is used.
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
```

# Sharing data between views



