
import UIKit

class CartPaymentViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

extension CartPaymentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelManage.shared.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = CartPaymentCell(style: .default, reuseIdentifier: "cartCell")
        
        return cell
    }
}

extension CartPaymentViewController: UITableViewDelegate {
    
}

extension CartPaymentViewController {
    @IBAction func payButton(_ sender: UIButton) {
        
        guard let vc =  self.storyboard?.instantiateViewController(withIdentifier: "CompletePaymentViewController") as? CompletePaymentViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}



