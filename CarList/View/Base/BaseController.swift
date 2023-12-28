

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}

@objc extension BaseController {
    func embedViews() {}
    
    func setupLayout() {}
    
    func setupAppearance() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .backgraundColor
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
}

