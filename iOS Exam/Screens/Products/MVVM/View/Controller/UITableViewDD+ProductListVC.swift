//
//  UITableViewDD+ProductListVC.swift
//  iOS Exam
//
//  Created by Mohammad Astafa Khan on 06/01/2024.
//

import UIKit

//MARK: - UITableView Datasource and delegate for Produect Listing with Search bar in Section Header.
extension ProductListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.FilterList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTVC.className) as? ProductTVC else{return UITableViewCell()}
        cell.UpdateDatainCell(product: self.FilterList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SearchBarTVH.className) as? SearchBarTVH else {return UIView()}
//        view.ViewMore.addTarget(self, action: #selector(self.ViewMoreButtonAction(sender:)), for: .touchUpInside)
        view.searchBar.delegate = self
        return view
    }
    
}

extension ProductListVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Filter the dataList based on the user input
        self.FilterList = searchText.isEmpty ? self.ProductList : self.ProductList.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
//        tableView.reloadData()
    }
}
