//
//  SceneDelegate.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()

        window = UIWindow(windowScene: windowScene)
        let rootVC = ViewController()
        let navigationController = UINavigationController(rootViewController: rootVC)

        window?.rootViewController = navigationController
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
