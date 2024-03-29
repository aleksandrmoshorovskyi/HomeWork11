//
//  ProfileViewController.swift
//  Lesson11HW
//

//

import UIKit

class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstCountLabel: UILabel!
    @IBOutlet weak var lastCountLable: UILabel!
    
    @IBAction func firstNameChanged(_ sender: Any) {
        updateCounters()
    }
    
    @IBAction func lastNameChanged(_ sender: Any) {
        updateCounters()
    }
    
    private var editMode = false
    private let maxCount = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupTextFieldMode()
    }
}

// MARK: - Private
private extension ProfileViewController {
    
    func setupActions() {
        updateRigthtBarButton()
    }
    
    func updateRigthtBarButton() {
        
        let title = editMode ? "Done" : "Edit"

        let barButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        editMode = !editMode
        updateRigthtBarButton()
        
        setupTextFieldMode()
    }
    
    func setupTextFieldMode() {
        firstNameTextField.isEnabled = editMode
        lastNameTextField.isEnabled = editMode
        
        updateCounters()
    }
    
    func getAttributedStrFor(count: Int) -> NSAttributedString {
        let strAttribute = [ NSAttributedString.Key.foregroundColor: count < maxCount ? UIColor.systemGreen : UIColor.systemRed ]
        let lableStrAttributed = NSAttributedString(string: String(count), attributes: strAttribute)
        
        return lableStrAttributed
    }
    
    func updateCounters() {
        firstCountLabel.isHidden = !editMode
        lastCountLable.isHidden = !editMode
        
        if let text = firstNameTextField.text {
            firstCountLabel.attributedText = getAttributedStrFor(count: text.count)
        }
        
        if let text = lastNameTextField.text {
            lastCountLable.attributedText  = getAttributedStrFor(count: text.count)
        }
    }
}

// MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return checkTextField(textField, in: range, str: string, for: maxCount)
    }
    
    private func checkTextField(_ textField: UITextField, in range: NSRange, str string: String, for count: Int) -> Bool {
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        return updatedText.count <= count
    }
}
