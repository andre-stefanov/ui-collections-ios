import UIKit

class NavigationController: UINavigationController {
    
    var data: [ColorSection]!
    
    var colorSelectedDelegate : ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let tableController = viewControllers[0] as? TableViewController {
            tableController.data = data
            tableController.colorSelectedDelegate = colorSelectedDelegate
        }

        if let collectionController = viewControllers[0] as? CollectionViewController {
            collectionController.data = data
            collectionController.colorSelectedDelegate = colorSelectedDelegate
        }
    }

}
