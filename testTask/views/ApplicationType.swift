import Foundation
import UIKit

/**
 ApplicationTypeDelegate. Used to intercept launching app and added special configuration for each role.
 */
protocol ApplicationTypeDelegate: class {
    
    var window: UIWindow? { get set }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func makeRoot(viewController: UIViewController?)
}


extension ApplicationTypeDelegate {
    func makeRoot(viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        if let strongWindow = window {
            strongWindow.rootViewController = viewController
            strongWindow.makeKeyAndVisible()
        }
    }
}
