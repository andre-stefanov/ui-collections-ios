import UIKit

struct Company {
    var name : String
    var tags : [String]
}

class TableViewController: UITableViewController {
    
    var data : [ColorSection]!
    
    var colorSelectedDelegate : ((String) -> Void)?
    
}

// UITableViewDataSource
extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        
        let color = data[indexPath.section].colors[indexPath.row]
        cell.label.text = color.toHexString()
        cell.backgroundColor = color
        
        return cell
    }
    
}

// UITableViewDelegate
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorSelectedDelegate?(data[indexPath.section].colors[indexPath.row].toHexString())
    }
    
}
