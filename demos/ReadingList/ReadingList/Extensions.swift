import UIKit

extension UIStoryboardSegue
{
    var target: UIViewController! {
        guard let navController = destination as? UINavigationController else { return destination }
        return navController.childViewControllers.first
    }
}


extension UIImage
{
    class func named(_ name: String) -> UIImage? {
        if let image = UIImage(named: name) { return image }
        return UIImage(named: "NoImage")
    }
}
