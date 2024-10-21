import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Home Tab with Navigation
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
            }
            
            // Search Tab with Navigation
            NavigationView {
                SearchView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            // Post Tab with Navigation
            NavigationView {
                PostView()
            }
            .tabItem {
                Image(systemName: "plus.circle")
            }
            
            // Profile Tab with Navigation
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.circle")
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark) // Optional: For dark mode preview
    }
}

