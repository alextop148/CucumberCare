import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPlayButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "PlayViewController", bundle: Bundle.main)
        guard let destinationVC = storyboard.instantiateInitialViewController() as? PlayViewController else { return }
        destinationVC
            .modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
}

