import UIKit

var provider: DependencyProviding = DependencyProvider()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    private var userViewController: UserViewController {
        return UserViewController(viewModel:  UserViewModel())
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if !AppConfiguration.isTestLaunch() {
            window?.rootViewController = UINavigationController(rootViewController: userViewController)
            window?.makeKeyAndVisible()
        }
        return true
    }

}
