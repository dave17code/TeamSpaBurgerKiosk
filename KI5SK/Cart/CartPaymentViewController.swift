
import UIKit

class CartPaymentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var payButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        payButton.titleLabel?.text = ModelManage.shared.formatPrice(ModelManage.shared.totalPrice) + " • 결제하기"
    }
}

extension CartPaymentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelManage.shared.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as? CartPaymentCell else { return CartPaymentCell() }
        cell.menu = ModelManage.shared.cart[indexPath.row]
        cell.tapAction = { buttonType in
            switch buttonType {
            case .add:
                ModelManage.shared.cart[indexPath.row].number += 1
                self.payButton.titleLabel?.text = ModelManage.shared.formatPrice(ModelManage.shared.totalPrice) + " • 결제하기"
                tableView.reloadData()
            case .sub:
                if ModelManage.shared.cart[indexPath.row].number > 1 {
                    ModelManage.shared.cart[indexPath.row].number -= 1
                    self.payButton.titleLabel?.text = ModelManage.shared.formatPrice(ModelManage.shared.totalPrice) + " • 결제하기"
                    tableView.reloadData()
                    
                }
            case .tapOption:
                let storyboard = UIStoryboard(name: "DetailOption", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "DetailOptionViewController") as UIViewController
                self.present(vc, animated: true, completion: nil)
            }
        }
        
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
    
    @IBAction func backButton(_ sender:UIButton) {
        self.dismiss(animated: true)
    }
}
