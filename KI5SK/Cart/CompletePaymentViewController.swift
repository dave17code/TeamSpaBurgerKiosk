//
//  CompletePaymentViewController.swift
//  KI5SK
//
//  Created by woonKim on 2023/12/31.
//

import UIKit
import Gifu

class CompletePaymentViewController: UIViewController {
    
    @IBOutlet weak var completePaymentGif: GIFImageView!
    @IBOutlet weak var timerDismissLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completePaymentGif.animate(withGIFNamed: "CompletePaymentGif") {}
        fireTimer()
    }
    
    func fireTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.timerDismissLbl.text = "\(2)초 뒤 자동으로 닫힙니다."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.timerDismissLbl.text = "\(1)초 뒤 자동으로 닫힙니다."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            ModelManage.shared.clearCart()
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
}
