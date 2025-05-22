import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    internal func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        
        Task { [weak self] in
            let clientConfig = GrpcClientConfig(host: "92.242.60.133", port: 80)

            let authenticationClient = try await AuthenticationClient(config: clientConfig)
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

            self?.window?.rootViewController = navigationController

            self?.window?.makeKeyAndVisible()
        }
    }

}

