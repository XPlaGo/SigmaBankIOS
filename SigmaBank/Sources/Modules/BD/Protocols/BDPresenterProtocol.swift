protocol BDPresenterProtocol: AnyObject {

    func viewDidLoad(view: BDViewProtocol, by path: String)

    func goToScreen(title: String, by path: String)

}
