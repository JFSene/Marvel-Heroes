//
//  HeroesListViewController+UITableViewDelegates.swift
//  MarvelHeroes
//
//  Created by Joel Sene on 01/02/21.
//

import UIKit

extension HeroesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource?.heroList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(ofType: HeroesListTableViewCell.self) else {
            return UITableViewCell()
        }
            cell.setCell(self.dataSource?.heroList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToHeroDetails(segue: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.dataSource?.heroList.count)! - 1 {
           //TODO: - Add Pagination
        }
    }
}
