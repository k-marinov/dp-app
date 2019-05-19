import UIKit

class UserViewController: UIViewController {

    private let viewModel: UserViewModel
    @IBOutlet private var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
    }

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setDetails()  {
        label.text = viewModel.userDetails()
    }

}
