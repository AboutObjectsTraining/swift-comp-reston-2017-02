import UIKit

class ReadingListController: UITableViewController
{
    @IBOutlet var dataSource: ReadingListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.load()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    func insert(_ book: Book) {
        dataSource.insert(book)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Add":
            if let addBookController = segue.target as? AddBookController {
                addBookController.completion = { [weak self] book in self?.insert(book) }
            }
        case "Edit":
            if let indexPath = tableView.indexPathForSelectedRow,
                let viewBookController = segue.target as? ViewBookController {
                viewBookController.book = dataSource.readingList?.books[indexPath.row]
            }
        default: break
        }
    }
}

// MARK: Action Methods
extension ReadingListController {
    @IBAction func doneEditing(segue: UIStoryboardSegue) {
        tableView.reloadData()
        dataSource.save()
    }
    @IBAction func cancelEditing(segue: UIStoryboardSegue) { }
    @IBAction func doneAdding(segue: UIStoryboardSegue)    { }
    @IBAction func cancelAdding(segue: UIStoryboardSegue)  { }
}

