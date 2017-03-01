import UIKit

extension CoolViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class CoolViewController: UIViewController
{
    var textField: UITextField?
    var contentView: CoolView?
    
    override func loadView() {
        view = UIView()
        
        let (accessoryRect, contentRect) = UIScreen.main.bounds.divided(atDistance: 90, from: .minYEdge)
        let accessoryView = UIView(frame: accessoryRect)
        contentView = CoolView(frame: contentRect)
        
        guard let contentView = contentView else { return }
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        contentView.clipsToBounds = true
        configureControls(accessoryView: accessoryView)
        
        view.backgroundColor = UIColor.brown
        accessoryView.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
    }
    
    func addCoolView() {
        let newCell = CoolViewCell()
        newCell.text = textField?.text
        newCell.sizeToFit()
        contentView?.addSubview(newCell)
    }
    
    func configureControls(accessoryView: UIView) {
        textField = UITextField(frame: CGRect(x: 20, y: 40, width: 240, height: 30))
        textField?.borderStyle = .roundedRect
        textField?.placeholder = "Enter some text"
        
        textField?.delegate = self
        
        if let textField = textField {
            accessoryView.addSubview(textField)
        }
        
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 270, dy: 40)
        
        button.addTarget(self, action: #selector(addCoolView), for: UIControlEvents.touchUpInside)
        
        accessoryView.addSubview(button)
    }
}
