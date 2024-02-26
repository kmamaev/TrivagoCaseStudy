import SwiftUI

public struct BrandButtonRepresentable: UIViewRepresentable {
    private let label: String
    private let variant: BrandButton.Configuration.Variant
    private let color: BrandButton.Configuration.Color
    private let leadingIcon: UIImage?
    private let trailingIcon: UIImage?
    @Binding var isEnabled: Bool
    private let onTap: () -> ()
    
    public init(_ label: String, variant: BrandButton.Configuration.Variant = .primary, color: BrandButton.Configuration.Color = .green, leadingIcon: UIImage? = nil, trailingIcon: UIImage? = nil, isEnabled: Binding<Bool> = .constant(true), onTap: @escaping () -> ()) {
        self.label = label
        self.variant = variant
        self.color = color
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self._isEnabled = isEnabled
        self.onTap = onTap
    }
    
    public func makeUIView(context: Context) -> BrandButton {
        let brandButton = BrandButton()
        let configuration = BrandButton.Configuration(variant: variant, color: color, leadingIcon: leadingIcon, trailingIcon: trailingIcon, isEnabled: isEnabled)
        brandButton.setConfiguration(configuration)
        brandButton.label = label
        brandButton.onTap = onTap
        brandButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return brandButton
    }

    public func updateUIView(_ brandButton: BrandButton, context: Context) {
        brandButton.isEnabled = isEnabled
    }
}
