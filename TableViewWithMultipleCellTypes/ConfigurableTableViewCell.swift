//
//  TableViewCellProtocol.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Daniel Martinez on 2/27/19.
//  Copyright © 2019 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

protocol ConfigurableTableViewCell:class where Self: UITableViewCell {
    var item: ProfileViewModelItem? { get set }
    var row: Int? { get set }
    
    func configure(row: Int, item: ProfileViewModelItem?)
}

extension ConfigurableTableViewCell {
    
    func configure(row: Int, item: ProfileViewModelItem?) {
        self.row = row
        self.item = item
    }
}
