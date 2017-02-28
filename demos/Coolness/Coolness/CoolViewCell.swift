import UIKit

class CoolViewCell: UIView
{
    class var defaultAttributes: [String: Any] {
        return [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18)]
    }
    
    var text: String?
    
    var highlighted = false {
        didSet {
            alpha = highlighted ? 0.5 : 1.0
        }
    }
}

//let defaultAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18)]


// MARK: - Drawing
extension CoolViewCell
{
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: CGPoint.zero, withAttributes: type(of:self).defaultAttributes)
    }
}


// MARK: - Responding to Touches
extension CoolViewCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let view = touch.view as? CoolViewCell else { return }
        view.superview?.bringSubview(toFront: view)
        view.highlighted = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let view = touch.view else { return }
        
        let currLocation = touch.location(in: view.superview)
        let prevLocation = touch.previousLocation(in: view.superview)
        
        view.center.x += currLocation.x - prevLocation.x
        view.center.y += currLocation.y - prevLocation.y
    }
    
    func finish(touch: UITouch?) {
        guard let view = touch?.view as? CoolViewCell else { return }
        view.highlighted = false
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        finish(touch: touches.first)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        finish(touch: touches.first)
    }
}
