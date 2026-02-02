//
//  IosBaseProjectApp.swift
//  IosBaseProject
//
//  Created by Arifin Firdaus on 27/01/26.
//

import SwiftUI

@main
struct IosBaseProjectApp: App {
	
	init() {
		tabBarAdjustment()
	}
	
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}

extension IosBaseProjectApp {
	
	private func tabBarAdjustment() {
		let appearance = UITabBarAppearance()
		
		appearance.configureWithOpaqueBackground()
		appearance.shadowColor = .clear
		appearance.shadowImage = UIImage()
		
		let normalFont = UIFont.baseStyle(size: 12, weight: .medium)
		let selectedFont = UIFont.baseStyle(size: 12, weight: .bold)
		
		appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
			.font: normalFont,
			.foregroundColor: UIColor(resource: .neutral90),
		]
		
		appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
			.font: selectedFont,
			.foregroundColor: UIColor(resource: .neutral90)
		]
		
		UITabBar.appearance().standardAppearance = appearance
		UITabBar.appearance().scrollEdgeAppearance = appearance
	}
}
