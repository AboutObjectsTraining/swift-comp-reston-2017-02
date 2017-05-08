import UIKit

@IBDesignable
class RoundedImageView: UIImageView
{
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        configure()
    }
}
