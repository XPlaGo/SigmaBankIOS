import UIKit
import Hero

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        
        let clientConfig = GrpcClientConfig(host: "92.242.60.133", port: 80)

        let authenticationClient = AuthenticationClient(config: clientConfig)
        let authenticationManager = AuthenticationManager()
        let authenticationService = AuthenticationService(
            client: authenticationClient,
            manager: authenticationManager)
        
        let accountClient = AccountClient(config: clientConfig)
        let accountService = AccountService(client: accountClient, authenticationManager: authenticationManager)

        let viewController = AuthorizationBuilder(
            authenticationManager: authenticationManager,
            authenticationService: authenticationService,
            accountService: accountService).build()

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.hero.isEnabled = true

        window?.rootViewController = navigationController

        window?.makeKeyAndVisible()
    }

}

