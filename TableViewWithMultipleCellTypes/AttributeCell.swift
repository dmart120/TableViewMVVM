//
//  AttributeCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell, ConfigurableTableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?
    
    var oldItem: Attribute?  {
        didSet {
            titleLabel?.text = oldItem?.key
            valueLabel?.text = oldItem?.value
        }
    }
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModeAttributeItem, let row = row else { return }
            
            let attribute = item.attributes[row]
            titleLabel?.text = attribute.key
            valueLabel?.text = attribute.value
        }
    }
    
    var row: Int?
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
