import UIKit

class ViewController: UITableViewController{
    
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addingProduct))
        
        shoppingList.append("kek")
        startGame()
        
    }
    
    
    @objc func startGame(){
        title = "title"
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = shoppingList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    
    
    @objc func addingProduct(){
        let alertController = UIAlertController(title: "Напишите продукт который вы хотите добавить", message: nil, preferredStyle: .alert)
         
        alertController.addTextField()
        let submitAction = UIAlertAction(title: "Отправить", style: .default) { [weak self, weak alertController] action in
            guard let answer = alertController?.textFields?[0].text else { return }
            self?.shoppingList.insert(answer, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true)
        tableView.reloadData()
    }
    


}

