//
//  ActivityIndicatorProtocol.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 17/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import UIKit

private let overlayViewTag = 999
private let activityIndicatorTag = 1000
private let pleaseWaitLabelTag = 1001

public protocol ActivityIndicatorProtocol {
    func displayActivityIndicator(shouldDisplay: Bool)
}

public extension ActivityIndicatorProtocol where Self: UIViewController {
    func displayActivityIndicator(shouldDisplay: Bool) {
        if shouldDisplay {
            setActivityIndicator()
        } else {
            removeActivityIndicator()
        }
    }

    private func setActivityIndicator() {
        guard !isDisplayingActivityIndicatorOverlay() else { return }
        guard let parentViewForOverlay = navigationController?.view ?? view else { return }

        //configure overlay
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.black
        overlay.alpha = 0.5
        overlay.tag = overlayViewTag

        //configure activity indicator
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.tag = activityIndicatorTag

        //configure label
        let pleaseWaitLabel = UILabel()
        pleaseWaitLabel.translatesAutoresizingMaskIntoConstraints = false
        pleaseWaitLabel.text = "Loading..."
        pleaseWaitLabel.textAlignment = .center
        pleaseWaitLabel.textColor = .white
        pleaseWaitLabel.tag = pleaseWaitLabelTag
        pleaseWaitLabel.sizeToFit()

        //add subviews
        overlay.addSubview(activityIndicator)
        overlay.addSubview(pleaseWaitLabel)
        parentViewForOverlay.addSubview(overlay)

        //add overlay constraints
        overlay.heightAnchor.constraint(equalTo: parentViewForOverlay.heightAnchor).isActive = true
        overlay.widthAnchor.constraint(equalTo: parentViewForOverlay.widthAnchor).isActive = true

        //add indicator constraints
        activityIndicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true

        //add label constraints
        pleaseWaitLabel.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        pleaseWaitLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 20).isActive = true

        //animate indicator
        activityIndicator.startAnimating()
    }

    private func removeActivityIndicator() {
        let activityIndicator = getActivityIndicator()
        let pleaseWaitLabel = getPleaseWaitLabel()

        if let overlayView = getOverlayView() {
            UIView.animate(withDuration: 0.2, animations: {
                overlayView.alpha = 0.0
                activityIndicator?.stopAnimating()
            }) { (_) in
                pleaseWaitLabel?.removeFromSuperview()
                activityIndicator?.removeFromSuperview()
                overlayView.removeFromSuperview()
            }
        }
    }

    private func isDisplayingActivityIndicatorOverlay() -> Bool {
        if let _ = getActivityIndicator(), let _ = getOverlayView() {
            return true
        }
        return false
    }

    private func getActivityIndicator() -> UIActivityIndicatorView? {
        return (navigationController?.view.viewWithTag(activityIndicatorTag) ?? view.viewWithTag(activityIndicatorTag)) as? UIActivityIndicatorView
    }

    private func getOverlayView() -> UIView? {
        return navigationController?.view.viewWithTag(overlayViewTag) ?? view.viewWithTag(overlayViewTag)
    }

    private func getPleaseWaitLabel() -> UIView? {
        return navigationController?.view.viewWithTag(pleaseWaitLabelTag) ?? view.viewWithTag(pleaseWaitLabelTag)
    }
}

