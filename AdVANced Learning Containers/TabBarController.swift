import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
        let data = Content.sections
        if let controllers = viewControllers as? [NavigationController] {
            for controller in controllers {
                controller.data = data
                controller.colorSelectedDelegate = { (colorHex) in
                    self.showToast(message: colorHex, seconds: 1)
                }
            }
        }
    }
    
    func showToast(message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }

}
