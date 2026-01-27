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
	TabView {
		Color.white
			.overlay(
				Text("Home")
					.font(.headline)
			)
			.tabItem {
				Image(systemName: "house")
				Text("Home")
			}
		
		Color.white
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
