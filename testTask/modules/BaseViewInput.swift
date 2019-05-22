import Foundation
import UIKit

/**
 BaseViewInput. Base view input protocol with default implementations of base methods.
 
 All view input protocols for different screens should be inherited from this protocol
 */
protocol BaseViewInput: class {
    
    func show(error: Error)
    func showLoading()
    func hideLoading()
    func viewController() -> UIViewController
    func dismiss()
    
}

extension BaseViewInput where Self: UIViewController {
    func show(error: Error) {
        showError(message: error.localizedDescription, viewController: self)
    }

    func showLoading() {
        view.showLoading()
    }

    func hideLoading() {
            self.view.hideLoading()
    }
    
    func viewController() -> UIViewController {
        return self
    }
    
    func dismiss() {
        viewController().dismiss(animated: true)
    }
}
