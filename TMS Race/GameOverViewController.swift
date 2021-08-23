import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    var totalScore = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalScoreLabel.text = totalScore
    }
    
    @IBAction func onTryAgainButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "PlayViewController", bundle: Bundle.main)
        guard let destinationVC = storyboard.instantiateInitialViewController() as? PlayViewController else { return }
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
    @IBAction func onMainMenuButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationVC = storyboard.instantiateInitialViewController() as? ViewController else { return }
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
}
