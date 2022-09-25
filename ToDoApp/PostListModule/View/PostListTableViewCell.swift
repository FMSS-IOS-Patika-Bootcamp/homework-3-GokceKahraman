

import UIKit

class PostListTableViewCell: UITableViewCell {

    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private(set) weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        containerView.backgroundColor =
            .lightGray.withAlphaComponent(0.3)
        containerView.layer.cornerRadius = 8
    }
}
