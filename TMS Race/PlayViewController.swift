import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var wallPicSixth: UIImageView!
    @IBOutlet weak var wallPicFifth: UIImageView!
    @IBOutlet weak var wallPicThird: UIImageView!
    @IBOutlet weak var wallPicSecond: UIImageView!
    @IBOutlet weak var wallPicFirst: UIImageView!
    @IBOutlet weak var wallPicSeventh: UIImageView!
    @IBOutlet weak var picklesImageView: UIImageView!
    @IBOutlet weak var windowOneView: UIImageView!
    @IBOutlet weak var windowTwoView: UIImageView!
    @IBOutlet weak var borderLeftView: UIView!
    @IBOutlet weak var borderRightView: UIView!
    
    var randomXForWindows = Int()
    
    var levelScore = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let timerWay = Timer.scheduledTimer(timeInterval: 0.008, target: self, selector: #selector(colourAnimation), userInfo: nil, repeats: true)
        timerWay.fire()
        let timerWindows = Timer.scheduledTimer(timeInterval: 0.008, target: self, selector: #selector(windowsAnimation), userInfo: nil, repeats: true)
        timerWindows.fire()
    }

    func movingSpace(space: UIView) {
        let outOfViewForSpace = CGFloat(-180.0)
        space.frame = CGRect(x: space.frame.origin.x, y: space.frame.origin.y - 1.0, width: space.frame.size.width, height: space.frame.size.height)
        levelScore += 1
        ScoreLabel.text = String(levelScore)
        if space.frame.origin.y == outOfViewForSpace {
            space.frame.origin.y = 900.00
        } 
    }
    
    func movingWindows(window: UIImageView) {
        let outOfViewForSpace = CGFloat(-172.0)
        window.frame = CGRect(x: window.frame.origin.x, y: window.frame.origin.y - 1.0, width: window.frame.size.width, height: window.frame.size.height)
        if window.frame.origin.y == outOfViewForSpace {
            randomXForWindows = Int.random(in: 50...150)
            window.frame.origin.y = 900.00
            window.frame.origin.x = CGFloat(randomXForWindows)
        } else if window.frame.intersects(picklesImageView.frame) {
            let storyboard = UIStoryboard(name: "GameOverViewController", bundle: Bundle.main)
            guard let destinationVC = storyboard.instantiateInitialViewController() as? GameOverViewController else { return }
            destinationVC.totalScore = String(levelScore)
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        } else if picklesImageView.frame.intersects(borderLeftView.frame) || picklesImageView.frame.intersects(borderRightView.frame) {
            let storyboard = UIStoryboard(name: "GameOverViewController", bundle: Bundle.main)
            guard let destinationVC = storyboard.instantiateInitialViewController() as? GameOverViewController else { return }
            destinationVC.totalScore = String(levelScore)
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        }
    }
    
    @objc private func windowsAnimation() {
        movingWindows(window: windowOneView)
        movingWindows(window: windowTwoView)
    }
    
    @objc private func colourAnimation() {
        movingSpace(space: wallPicSixth)
        movingSpace(space: wallPicFifth)
        movingSpace(space: wallPicThird)
        movingSpace(space: wallPicFirst)
        movingSpace(space: wallPicSecond)
        movingSpace(space: wallPicSeventh)
    }
    
    @IBAction func onPanMovePickles(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: self.view)
        picklesImageView.center = CGPoint(x: picklesImageView.center.x + transition.x, y: picklesImageView.center.y + transition.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}
