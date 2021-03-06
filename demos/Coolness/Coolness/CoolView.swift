import UIKit

class CoolView: UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let view1 = CoolViewCell(frame: CGRect(x: 20, y: 60, width: 80, height: 30))
        let view2 = CoolViewCell(frame: CGRect(x: 50, y: 120, width: 80, height: 30))
        
        addSubview(view1)
        addSubview(view2)
        
        view1.text = "The race is to the Swift."
        view2.text = "Hello 🌎!"
        
        view1.backgroundColor = UIColor.purple
        view2.backgroundColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

