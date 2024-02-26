import UIKit

class BrandButtonWithStoryboardViewController: UIViewController {
    @IBOutlet private var alignedToLeftButton: BrandButton!
    @IBOutlet private var alignedToRightButton: BrandButton!
    @IBOutlet private var centeredButton: BrandButton!
    @IBOutlet private var fullWidthButton: BrandButton!
    
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
    }
}
