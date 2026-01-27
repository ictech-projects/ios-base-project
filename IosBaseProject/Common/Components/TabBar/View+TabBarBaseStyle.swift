import SwiftUI
import Introspect

// MARK: - ViewModifier

struct TabBarBaseStyleModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.tabViewStyle(.automatic)
			.introspectTabBarController { tabBarController in
				let tabBar = tabBarController.tabBar
				tabBar.layer.masksToBounds = false
				tabBar.layer.shadowColor = UIColor.black.cgColor
				tabBar.layer.shadowOpacity = 0.06
				tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
				tabBar.layer.shadowRadius = 4
			}
	}
}

// MARK: - View Extension

extension View {
	/// Applies the base Tab Bar styling used across the app.
	func tabBarBaseStyle() -> some View {
		modifier(TabBarBaseStyleModifier())
	}
}

// MARK: - SwiftUI Preview

#Preview("Tab Bar Base Style") {
	ZStack {
		Color.gray.opacity(0.5)
			.ignoresSafeArea()
		
		TabView {
			VStack(spacing: 0) {
				TopBarView(title: "Home")
				Color.neutral40
			}
			.overlay(
				Text("Home")
					.font(.headline)
			)
			.tabItem {
				Image(systemName: "house")
				Text("Home")
			}
			
			VStack(spacing: 0) {
				TopBarView(title: "Profile")
				Color.neutral40
			}
			.overlay(
				Text("Profile")
					.font(.headline)
			)
			.tabItem {
				Image(systemName: "person")
				Text("Profile")
			}
		}
		.tabBarBaseStyle()
	}
}
