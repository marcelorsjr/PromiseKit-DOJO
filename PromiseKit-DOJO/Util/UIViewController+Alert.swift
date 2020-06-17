//
//  UIViewController+Alert.swift
//  PromiseKit-DOJO
//
//  Created by Marcelo Rodrigues dos Santos Junior on 17/06/20.
//  Copyright © 2020 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    @discardableResult
    func showAlert(title: String?,
                   message: String?,
                   handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {

        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(alert, animated: true)
        return alert
    }
}
