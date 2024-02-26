import UIKit

enum Example {
    case brandButtonVariations
    case brandButtonWithCode
    case brandButtonWithStoryboard
    case brandButtonWithSwiftUI
}

class ExampleChooserViewController: UITableViewController {
    private enum Constants {
        static let cellReuseId = "cellReuseId"
    }
    
    private let exmaples: [Example] = [
            .brandButtonVariations,
            .brandButtonWithCode,
            .brandButtonWithStoryboard,
            .brandButtonWithSwiftUI,
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Examples"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellReuseId)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exmaples.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseId, for: indexPath)
        cell.textLabel?.text = exmaples[indexPath.row].displayName
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showExample(exmaples[indexPath.row])
    }
}

// MARK: - Navigation

extension ExampleChooserViewController {
    func showExample(_ example: Example) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        switch example {
        case .brandButtonVariations:
            let viewController = mainStoryboard.instantiateViewController(identifier: "BrandButtonVariationsViewController")
            navigationController?.pushViewController(viewController, animated: true)
        case .brandButtonWithCode:
            let viewController = BrandButtonWithCodeViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case .brandButtonWithStoryboard:
            let viewController = mainStoryboard.instantiateViewController(identifier: "BrandButtonWithStoryboardViewController")
            navigationController?.pushViewController(viewController, animated: true)
        case .brandButtonWithSwiftUI:
            // TODO: implement
            print("Not implemented yet")
            break
        }
    }
}

private extension Example {
    var displayName: String {
        switch self {
        case .brandButtonVariations: return "BrandButton Variations"
        case .brandButtonWithCode: return "BrandButton with Code"
        case .brandButtonWithStoryboard: return "BrandButton with Storyboard"
        case .brandButtonWithSwiftUI: return "BrandButton with SwiftUI"
        }
    }
}
