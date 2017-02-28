import UIKit

class CoolViewController: UIViewController
{
    override func loadView() {
        view = UIView()
        
        let (accessoryRect, contentRect) = UIScreen.main.bounds.divided(atDistance: 90, from: .minYEdge)
        let accessoryView = UIView(frame: accessoryRect)
        let contentView = CoolView(frame: contentRect)
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        view.backgroundColor = UIColor.brown
        accessoryView.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
    }
}
