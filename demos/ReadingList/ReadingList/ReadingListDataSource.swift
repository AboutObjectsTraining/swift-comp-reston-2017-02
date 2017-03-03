import UIKit

class ReadingListDataSource: NSObject, UITableViewDataSource
{
    var readingList: ReadingList?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var store: ReadingListStore!
        
    func load() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.readingList = self?.store.fetchReadingList()
            print(self?.readingList ?? "")
            self?.refresh()
        }
    }
    
    func refresh() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func insert(_ book: Book) {
        readingList?.books.insert(book, at: 0)
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        save()
    }
    
    func save() {
        guard let readingList = readingList else { return }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.store.saveReadingList(readingList)
        }
    }
}


// MARK: - UITableViewDataSource Methods

extension ReadingListDataSource
{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        guard editingStyle == .delete else { return }
        readingList?.books.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        save()
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        guard let book = readingList?.books[sourceIndexPath.row] else { return }
        readingList?.books.remove(at: sourceIndexPath.row)
        readingList?.books.insert(book, at: destinationIndexPath.row)
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        save()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList?.books.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") else {
            fatalError("Unable to dequeue a cell with identifier 'BookCell'. Make sure the identifier is set in the storyboard.")
        }
        
        populate(cell: cell, at: indexPath)
        
        return cell
    }
    
    func populate(cell: UITableViewCell, at indexPath: IndexPath) {
        let book = readingList?.books[indexPath.row]
        cell.textLabel?.text = book?.title
        cell.detailTextLabel?.text = "\(book?.year ?? "N/A")  \(book?.author?.fullName ?? "")"
        cell.imageView?.image = UIImage.named(book?.author?.lastName ?? "")
    }
}
