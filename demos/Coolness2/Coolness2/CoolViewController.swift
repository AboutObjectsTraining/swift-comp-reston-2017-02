import UIKit

class CoolViewController: UIViewController
{
    @IBOutlet var textField: UITextField?
    @IBOutlet var contentView: CoolView?
    
    @IBAction func addCoolView() {
        let newCell = CoolViewCell()
        newCell.text = textField?.text
        newCell.sizeToFit()
        contentView?.addSubview(newCell)
    }
}

extension CoolViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


// Loading nib files
extension CoolViewController
{
    //    func loadView2() {
    //        Bundle.main.loadNibNamed("CoolStuff", owner: self, options: nil)
    //    }
    //
    //    func loadView1() {
    //        guard let topLevelObjs = Bundle.main.loadNibNamed("CoolStuff", owner: nil, options: nil),
    //            let backgroundView = topLevelObjs.first as? UIView else {
    //            return
    //        }
    //        view = backgroundView
    //    }
}
