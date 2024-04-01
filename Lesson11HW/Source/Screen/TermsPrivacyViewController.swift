//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

//

import UIKit

class TermsPrivacyViewController: BaseViewController {
    
    @IBOutlet weak var agreeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agreeBtn.setTitle("I Agree", for: .normal)
        agreeBtn.setTitle("I Agree", for: .selected)
        
        agreeBtn.layer.cornerRadius = 4
        
        setupButton(agreeBtn, with: false)
    }
}

extension TermsPrivacyViewController: UITextViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y + scrollView.frame.size.height >=
            scrollView.contentSize.height {
            setupButton(agreeBtn, with: true)
        }
    }
}
