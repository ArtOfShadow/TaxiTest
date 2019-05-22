import Foundation
import UIKit

/**
 Utils for handling and showing errors.
 */

enum ErrorCode: Int {
    case unknownError = -999
}

func showError(message: String, viewController: UIViewController?, completion: @escaping () -> Void = {}) {
    let alert = UIAlertController(title: "Error".localized, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok".localized, style: .default) { _ in
        completion()
    })
    if let viewController = viewController {
        viewController.present(alert, animated: true)
    } else {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController!.present(alert, animated: true)
    }
}

