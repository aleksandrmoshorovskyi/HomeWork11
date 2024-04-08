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
    
    //для різної кількості у різних текстових полях
    private var countForTextField: [UITextField : (label: UILabel, maxCount: Int)] = [ : ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //для різної кількості у різних текстових полях
        countForTextField[firstNameTextField] = (firstCountLabel, 30)
        countForTextField[lastNameTextField] = (lastCountLable, 30)
        
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
        //debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        editMode = !editMode
        updateRigthtBarButton()
        
        setupTextFieldMode()
    }
    
    func setupTextFieldMode() {
        for textField in countForTextField.keys {
            textField.isEnabled = editMode
        }
        
        updateCounters()
    }
    
    func setLabel(_ label: UILabel, for textField: UITextField, withMaxCount maxCount: Int) {
        if let text = textField.text {
            
            let textCurrentCount = text.count
            
            let strAttribute = [NSAttributedString.Key.foregroundColor: textCurrentCount < countForTextField[textField]?.maxCount ?? maxCount ? UIColor.systemGreen : UIColor.systemRed]
            
            let lableStrAttributed = NSAttributedString(string: String(textCurrentCount), attributes: strAttribute)
            
            label.attributedText = lableStrAttributed
        }
    }
    
    func updateCounters() {
        for (textField, params) in countForTextField {
            params.label.isHidden = !editMode
            setLabel(params.label, for: textField, withMaxCount: params.maxCount)
        }
    }
}

// MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return checkTextField(textField.text, in: range, str: string, for: countForTextField[textField]?.maxCount ?? maxCount)
    }
}
