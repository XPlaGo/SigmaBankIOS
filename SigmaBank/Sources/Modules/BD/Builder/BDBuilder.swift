import UIKit

class BDBuilder: BDBuilderProtocol {

    func build(title: String, path: String) -> UIViewController {
        let bdService = BDService(
            client: BDClient(config: NetworkConfiguration.bdHost),
            mapper: DefaultBDMapper()
        )
        let router = BDRouter()
        let interactor = BDInteractor(dbService: bdService)
        let presenter = BDPresenter(router: router, interactor: interactor)
        let view = BDViewController(
            title: title,
            path: path,
            presenter: presenter)

        router.viewController = view
        interactor.output = presenter

        return view
    }
    
}
