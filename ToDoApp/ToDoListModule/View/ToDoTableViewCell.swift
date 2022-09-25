
import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!

    @IBOutlet weak var checkMark: UIButton!

    
    var isMarked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

struct Todo{
    var isMarked : Bool
}

