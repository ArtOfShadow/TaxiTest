import Foundation
import UIKit

/**
 Base view class. Allows to implement fast initialization both int the IB and in the code
 */

class BaseScreenView: UIView {

}

extension UIView {
    
    @objc func showLoading(progress: Double) {
        
        let loadingView = (subviews.first(where: { $0 is LoaderView }) as? LoaderView) ?? LoaderView()
        
        if loadingView.superview == nil {
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(loadingView)
            
            loadingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            loadingView.alpha = 0
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0.0,
                    options: .transitionCrossDissolve,
                    animations: {
                        loadingView.alpha = 1.0
                },
                    completion: nil
                )
            }
        
        loadingView.setProgress(progress)
    }
    
    @objc func showLoading() {
        let loaderView = LoaderView()
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loaderView)
        
        loaderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loaderView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        loaderView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        loaderView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loaderView.alpha = 0
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .transitionCrossDissolve,
            animations: {
                loaderView.alpha = 1.0
        },
            completion: nil
        )
    }
    
    @objc func hideLoading() {
            for subview in subviews {
                if let loader = subview as? LoaderView {
                    UIView.animate(
                        withDuration: 0.3,
                        delay: 0.0,
                        options: .transitionCrossDissolve,
                        animations: {
                            loader.alpha = 0.0
                    },
                        completion: { result in
                            loader.removeFromSuperview()
                    }
                    )
            }
        }
    }
}
