import UIKit

//let defaultAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18)]
private let xPadding: CGFloat = 10
private let yPadding: CGFloat = 5
private let textOrigin = CGPoint(x: xPadding, y: yPadding)

@IBDesignable
class CoolViewCell: UIView
{
    var defaultAttributes: [String: Any] {
        return [NSFontAttributeName: UIFont.boldSystemFont(ofSize: fontSize ?? 18),
                NSForegroundColorAttributeName: UIColor.white]
    }
    
    @IBInspectable var fontSize: CGFloat? {
        didSet { sizeToFit() }
    }
    
    @IBInspectable var text: String? {
        didSet {
            sizeToFit()
        }
    }
    
    var highlighted = false {
        didSet {
            alpha = highlighted ? 0.5 : 1.0
        }
    }
    
    func configureLayer() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    func configureGestureRecognizers() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(bounce(recognizer:)))
        addGestureRecognizer(tapRecognizer)
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        addGestureRecognizer(panRecognizer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayer()
        configureGestureRecognizers()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.masksToBounds = true
    }
    
    func pan(recognizer: UIPanGestureRecognizer) {
        // print("In \(#function)")
        let translation = recognizer.translation(in: nil)
        center.x += translation.x
        center.y += translation.y
        recognizer.setTranslation(CGPoint.zero, in: nil)
        
        highlighted = recognizer.state == .began || recognizer.state == .changed
    }
}

// MARK: - Animation
extension CoolViewCell
{
    func bounce(recognizer: UITapGestureRecognizer) {
        animateBounce(duration: 1.0, size: CGSize(width: 120, height: 240))
    }
    
    func configureBounce(size: CGSize) {
        UIView.setAnimationRepeatCount(3.5)
        UIView.setAnimationRepeatAutoreverses(true)
        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        transform = translation.rotated(by: CGFloat.pi / 2)
    }
    
    func animateCompletion(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.transform = CGAffineTransform.identity
        }
    }
    
    func animateBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration:
            duration,
            animations: { [weak self] in self?.configureBounce(size: size) },
            completion: { [weak self] _ in self?.animateCompletion(duration: duration, size: size) })
    }
}


// MARK: - Drawing
extension CoolViewCell
{
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        var newSize = (text as NSString).size(attributes: defaultAttributes)
        newSize.width += 2 * xPadding
        newSize.height += 2 * yPadding
        return newSize
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: textOrigin, withAttributes: defaultAttributes)
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
//        guard let touch = touches.first, let view = touch.view else { return }
//        
//        let currLocation = touch.location(in: view.superview)
//        let prevLocation = touch.previousLocation(in: view.superview)
//        
//        view.center.x += currLocation.x - prevLocation.x
//        view.center.y += currLocation.y - prevLocation.y
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
