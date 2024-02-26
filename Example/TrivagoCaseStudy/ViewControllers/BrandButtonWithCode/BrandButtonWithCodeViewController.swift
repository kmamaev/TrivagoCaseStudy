import UIKit
import BrandButton

class BrandButtonWithCodeViewController: UIViewController {
    private let stackView = UIStackView()
    private let alignedToLeftButton = BrandButton()
    private let alignedToRightButton = BrandButton()
    private let centeredButton = BrandButton()
    private let fullWidthButton = BrandButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alignedToLeftButton.label = "Aligned to Left"
        alignedToLeftButton.leadingIcon = UIImage(systemName: "heart.fill")
        alignedToLeftButton.tintColor = .systemPink
        alignedToRightButton.label = "Aligned to Right"
        alignedToRightButton.color = .blue
        alignedToRightButton.trailingIcon = UIImage(systemName: "heart.fill")
        alignedToRightButton.tintColor = .systemPink
        centeredButton.label = "Aligned to Center"
        centeredButton.variant = .secondary
        fullWidthButton.label = "Full Width"
        fullWidthButton.setConfiguration(.init(variant: .secondary, color: .blue))
        
        [
                alignedToLeftButton,
                alignedToRightButton,
                centeredButton,
                fullWidthButton,
            ]
            .forEach { button in
                button.onTap = {
                        print("Button '\(button.label ?? "")' tapped")
                    }
            }
        
        configureStackView()
        view.backgroundColor = .white
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        [
                ({ button, wrapperView in
                    wrapperView.addSubview(button)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        button.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 4),
                        button.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 16),
                        button.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -4)
                    ])
                    return wrapperView
                }(alignedToLeftButton, UIView())),
            
                ({ button, wrapperView in
                    wrapperView.addSubview(button)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        button.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 4),
                        button.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: -16),
                        button.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -4)
                    ])
                    return wrapperView
                }(alignedToRightButton, UIView())),
            
                ({ button, wrapperView in
                    wrapperView.addSubview(button)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        button.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 4),
                        button.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
                        button.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -4)
                    ])
                    return wrapperView
                }(centeredButton, UIView())),
            
                ({ button, wrapperView in
                    wrapperView.addSubview(button)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        button.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 4),
                        button.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 16),
                        button.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -4),
                        button.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: -16),
                    ])
                    return wrapperView
                }(fullWidthButton, UIView())),
            ]
            .forEach { wrapperView in
                stackView.addArrangedSubview(wrapperView)
            }
    }
}
