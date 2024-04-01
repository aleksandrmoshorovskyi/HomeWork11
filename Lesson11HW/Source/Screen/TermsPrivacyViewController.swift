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
        
        setAgreeBtn(false)
    }
    
    private func setAgreeBtn(_ enableMode: Bool) {
        if enableMode {
            agreeBtn.isEnabled = true
            agreeBtn.backgroundColor = .systemBlue
        } else {
            agreeBtn.isEnabled = false
            agreeBtn.backgroundColor = .systemGray
        }
    }
}

extension TermsPrivacyViewController: UITextViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollPositionY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
        
        let bottomPosition = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if bottomPosition >= contentHeight {
            setAgreeBtn(true)
        }
    }
}
