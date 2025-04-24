import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        
        let authenticationManager = AuthenticationManager()
        let authenticationService = AuthenticationService(manager: authenticationManager)

        let viewController = AuthorizationBuilder().build(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService)

        let navigationController = UINavigationController(rootViewController: viewController)

        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()
    }

}

