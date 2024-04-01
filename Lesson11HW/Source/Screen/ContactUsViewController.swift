//
//  ContactUsViewController.swift
//  Lesson11HW
//

//

import UIKit

class ContactUsViewController: BaseViewController {
    
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var generalTextView: UITextView!
    @IBOutlet weak var labelTextView: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    
    private let minCount = 15
    private let maxCount = 320
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generalTextView.text = nil
        
        generalView.layer.cornerRadius = 8
        
        labelTextView.text = "type here"
        labelTextView.textColor = .systemGray
        
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.setTitle("Submit", for: .selected)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.layer.cornerRadius = 14
        
        setupUI()
    }
}

extension ContactUsViewController {
    func setupUI() {
        if let text = generalTextView.text {
            let textCount = text.count
            let textColor: UIColor
            
            labelTextView.isHidden = textCount > 0
            setupButton(submitBtn, with: textCount >= minCount)
            countLabel.text = String(textCount)
            
            switch textCount {
            case 0..<minCount:
                textColor = .systemRed
            case minCount..<maxCount:
                textColor = .systemGreen
            default:
                textColor = .systemRed
            }
            
            let strAttribute = [NSAttributedString.Key.foregroundColor: textColor]
            
            let lableStrAttributed = NSAttributedString(string: String(textCount), attributes: strAttribute)
            
            countLabel.attributedText = lableStrAttributed
        }
    }
}

extension ContactUsViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return checkTextField(textView.text, in: range, str: text, for: maxCount)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        setupUI()
    }
}
