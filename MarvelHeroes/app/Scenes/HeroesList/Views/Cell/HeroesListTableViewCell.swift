//
//  HeroesListTableViewCell.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 01/02/21.
//

import UIKit
import Kingfisher

class HeroesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.layer.shadowRadius = 2
            self.containerView.layer.shadowColor = #colorLiteral(red: 0.9750739932, green: 0.9750967622, blue: 0.9750844836, alpha: 0.9299582138)
            self.containerView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var initialDescription: UILabel!
    
    var heroDetails: HeroModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(_ dataSource: HeroModel?) {
        self.heroDetails = dataSource
        self.imageView?.kf.indicatorType = .activity
        self.imageView?.kf.setImage(with: dataSource?.thumbnail?.url)
        self.titleLabel.text = dataSource?.name
        self.initialDescription.text = (dataSource?.description!.isEmpty)! ? "Bio not available" : dataSource?.description
        
    }
}
