//
//  UIAlert+Extension.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 01/02/21.
//

import Foundation
import UIKit

class Alert {
    static func showMessage(title: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okButton)
        return alert
    }
}
