//
//  UITableView+Extensions.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 01/02/21.
//

import UIKit

extension UITableView {
    func registerNibFrom(_ cellClass: UITableViewCell.Type) {
        let nib = UINib(nibName: cellClass.className(), bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellClass.className())
    }
    
    func registerNibs(_ cellClasses : [UITableViewCell.Type]) {
        cellClasses.forEach { self.registerNibFrom($0) }
    }
    
    func dequeueReusableCell<T : UITableViewCell>(ofType type: T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: type.className()) as? T
    }
    
    func dequeueReusableCell<T : UITableViewCell>(ofType type: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: type.className(), for: indexPath) as? T
    }
    
    func bounceOnlyOnBottom(_ scrollView: UIScrollView) {
        if scrollView == self {
            if self.contentOffset.y <= 0 {
                self.contentOffset = CGPoint.zero
            }
        }
    }
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 280, height: 150))
        messageLabel.text = message
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.insetsLayoutMarginsFromSafeArea = true
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        self.separatorStyle = .none;
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

protocol ReusableCellIdentifiable {
    static var reusableIdentifier: String { get }
}

extension ReusableCellIdentifiable {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableCellIdentifiable {}


extension UITableView {
    func registerTableViewCell<T: ReusableCellIdentifiable>(_ cell: T.Type) {
        register(
            UINib(
                nibName: String(describing: cell),
                bundle: nil
            ),
            forCellReuseIdentifier: T.reusableIdentifier
        )
    }
}

