import UIKit

class BrandButtonVariationsViewController: UIViewController {
    @IBOutlet private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonConfigurations: [BrandButton.Configuration] = [
                .init(variant: .primary, color: .green),
                .init(variant: .primary, color: .blue),
                .init(variant: .primary, color: .green, isEnabled: false),
                .init(variant: .primary, color: .green, leadingIcon: exampleIcon()),
                .init(variant: .primary, color: .blue, leadingIcon: exampleIcon()),
                .init(variant: .primary, color: .green, leadingIcon: exampleIcon(), isEnabled: false),
                .init(variant: .primary, color: .green, trailingIcon: exampleIcon()),
                .init(variant: .primary, color: .blue, trailingIcon: exampleIcon()),
                .init(variant: .primary, color: .green, trailingIcon: exampleIcon(), isEnabled: false),
                .init(variant: .secondary, color: .green),
                .init(variant: .secondary, color: .blue),
                .init(variant: .secondary, color: .green, isEnabled: false),
                .init(variant: .secondary, color: .green, leadingIcon: exampleIcon()),
                .init(variant: .secondary, color: .blue, leadingIcon: exampleIcon()),
                .init(variant: .secondary, color: .green, leadingIcon: exampleIcon(), isEnabled: false),
                .init(variant: .secondary, color: .green, trailingIcon: exampleIcon()),
                .init(variant: .secondary, color: .blue, trailingIcon: exampleIcon()),
                .init(variant: .secondary, color: .green, trailingIcon: exampleIcon(), isEnabled: false),
            ]
        
        buttonConfigurations.forEach({ configuration in
            let button = BrandButton()
            button.setConfiguration(configuration)
            button.label = configuration.displayName
            button.tintColor = UIColor.systemPink
            button.onTap = { print("Button '\(configuration.displayName)' tapped") }
            
            let wrapperView = UIView()
            wrapperView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 4),
                button.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
                button.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -4)
            ])
            
            stackView.addArrangedSubview(wrapperView)
        })
    }
    
    private func exampleIcon() -> UIImage {
        return UIImage(systemName: "heart.fill")!
    }
}

private extension BrandButton.Configuration {
    var displayName: String {
        "\(variant.displayName) \(color.displayName)\(isEnabled ? "" : " Disabled")"
    }
}

private extension BrandButton.Configuration.Variant {
    var displayName: String {
        switch self {
        case .primary: return "Primary"
        case .secondary: return "Secondary"
        }
    }
}

private extension BrandButton.Configuration.Color {
    var displayName: String {
        switch self {
        case .green: return "Green"
        case .blue: return "Blue"
        }
    }
}
