import UIKit

class DetailViewController: UIViewController {

    var post:Post?
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var tvBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let passedPost = post{
            let user = DAO.sharedInstance.userByID(userId: passedPost.userID)
            
            lblTitle.text = passedPost.title
            lblUser.text = user.userName
            tvBody.text = passedPost.body
        }
    }
}
