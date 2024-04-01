//
//  BaseViewController.swift
//  Lesson11HW
//

//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

extension BaseViewController {
    func setupButton(_ button: UIButton,with enableMode: Bool) {
        if enableMode {
            button.isEnabled = true
            button.backgroundColor = .systemBlue
        } else {
            button.isEnabled = false
            button.backgroundColor = .systemGray
        }
    }
    
    func checkTextField(_ text: String?, in range: NSRange, str string: String, for count: Int) -> Bool {
        
        let currentText = text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        return updatedText.count <= count
    }
}

// MARK: - Private
private extension BaseViewController {
    
    func setupAppearance() {
        view.backgroundColor = .systemGroupedBackground
    }
}
