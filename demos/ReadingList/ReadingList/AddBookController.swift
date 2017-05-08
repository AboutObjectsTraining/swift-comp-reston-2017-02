import UIKit

class AddBookController: UITableViewController
{
    var completion: ((Book) -> Void)?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    var book: Book {
        return Book(dictionary: [TitleKey: titleField.text ?? "",
                                 YearKey: yearField.text ?? "",
                                 AuthorKey: [FirstNameKey: firstNameField.text ?? "",
                                             LastNameKey: lastNameField.text ?? ""]])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier ?? "" == "Done" else { return }
        completion?(book)
    }
}
