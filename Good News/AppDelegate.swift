//
//  AppDelegate.swift
//  Good News
//
//  Created by kenjimaeda on 26/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let apperance = UINavigationBarAppearance()
		apperance.configureWithOpaqueBackground()
		apperance.backgroundColor = UIColor(red: 47/255, green: 54/255, blue: 65/255, alpha: 1.0)
		apperance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		apperance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		UINavigationBar.appearance().scrollEdgeAppearance = apperance
		UINavigationBar.appearance().standardAppearance = apperance
		return true
	}
	
	// MARK: UISceneSession Lifecycle
	
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
	
	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}
	
	
}

