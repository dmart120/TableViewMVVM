//
//  FriendCell.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 5/21/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell, ConfigurableTableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    
    var oldItem: Friend? {
        didSet {
            guard let item = oldItem else { return }
            
            if let pictureUrl = item.pictureUrl {
                pictureImageView?.image = UIImage(named: pictureUrl)
            }
            
            nameLabel?.text = item.name
        }
    }
    
    var row: Int?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModeFriendsItem, let row = row else { return }
            
            let friend = item.friends[row]
            if let pictureUrl = friend.pictureUrl {
                pictureImageView?.image = UIImage(named: pictureUrl)
            }
            nameLabel?.text = friend.name
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pictureImageView?.layer.cornerRadius = 40
        pictureImageView?.clipsToBounds = true
        pictureImageView?.contentMode = .scaleAspectFit
        pictureImageView?.backgroundColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pictureImageView?.image = nil
    }
}
