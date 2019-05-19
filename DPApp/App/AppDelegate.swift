import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    var provider: DependencyProvider = {
        return DependencyProvider()
    }()

    private var userViewController: UserViewController {
        return UserViewController(viewModel:  UserViewModel(provider: provider))
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if isProductionEnabled() {
            window?.rootViewController = UINavigationController(rootViewController: userViewController)
            window?.makeKeyAndVisible()
        }
        return true
    }

    private func isProductionEnabled() -> Bool {
        return !ProcessInfo.processInfo.arguments.contains("TEST_MODE_ENABLED")
    }

}
