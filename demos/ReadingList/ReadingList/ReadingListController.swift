import UIKit

class ReadingListController: UITableViewController
{
    let store = ReadingListStore("BooksAndAuthors")
    var readingList: ReadingList?
    // lazy var readingList: ReadingList? = self.store.fetchReadingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Move to a secondary thread
        readingList = store.fetchReadingList()
        print(readingList ?? "")
    }
    
    func insert(_ book: Book) {
        readingList?.books.insert(book, at: 0)
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        save()
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
                viewBookController.book = readingList?.books[indexPath.row]
            }
        default: break
        }
    }
    
    func save() {
        guard let readingList = readingList else { return }
        store.saveReadingList(readingList)
    }
}

// MARK: - UITableViewDataSource

extension ReadingListController
{
    // TODO: Support deletion
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList?.books.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") else {
            fatalError("Unable to dequeue a cell with identifier 'BookCell'. Make sure the identifier is set in the storyboard.")
        }
        
        let book = readingList?.books[indexPath.row]
        cell.textLabel?.text = book?.title
        cell.detailTextLabel?.text = "\(book?.year ?? "N/A")  \(book?.author?.fullName ?? "")"
        
        // TODO: Default image
        cell.imageView?.image = UIImage(named: book?.author?.lastName ?? "NoImage")
        
        return cell
    }
}

// MARK: Action Methods

extension ReadingListController {
    @IBAction func doneEditing(segue: UIStoryboardSegue) {
        tableView.reloadData()
        save()
    }
    @IBAction func cancelEditing(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func doneAdding(segue: UIStoryboardSegue) {
        
    }
    @IBAction func cancelAddint(segue: UIStoryboardSegue) {
        
    }
}

