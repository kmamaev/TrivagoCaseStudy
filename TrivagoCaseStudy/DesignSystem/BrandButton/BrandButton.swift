import UIKit
import os

@IBDesignable public final class BrandButton: UIView {
    private static let logger = Logger(subsystem: "Design System", category: "TrigavoButton")
    
    private enum Constants {
        static let padding: CGFloat = 16
        static let iconGap: CGFloat = 12
        static let iconSize: CGFloat = 24
    }
    
    struct Configuration {
        enum Variant {
            case primary
            case secondary
        }
        enum Color {
            case green
            case blue
        }
        enum Size {
            case regular
        }
        
        let variant: Variant
        let color: Color
        let leadingIcon: UIImage?
        let trailingIcon: UIImage?
        let isEnabled: Bool
        
        init(variant: Variant = .primary, color: Color = .green, leadingIcon: UIImage? = nil, trailingIcon: UIImage? = nil, isEnabled: Bool = true) {
            self.variant = variant
            self.color = color
            self.leadingIcon = leadingIcon
            self.trailingIcon = trailingIcon
            self.isEnabled = isEnabled
        }
    }
    
    func setConfiguration(_ configuration: Configuration) {
        variant = configuration.variant
        color = configuration.color
        leadingIcon = configuration.leadingIcon
        trailingIcon = configuration.trailingIcon
        isEnabled = configuration.isEnabled
    }

    @IBInspectable var label: String? {
        get {
            return button.titleLabel?.text
        } set {
            button.setTitle(newValue, for: .normal)
        }
    }
    var variant: Configuration.Variant = .primary {
        didSet {
            updateButtonColors()
        }
    }
    var leadingIcon: UIImage? = nil {
        didSet {
            updateLeftIcon()
        }
    }
    var trailingIcon: UIImage? = nil {
        didSet {
            updateRightIcon()
        }
    }
    var isEnabled: Bool { 
        get {
            return button.isEnabled
        } set {
            button.isEnabled = newValue
            updateIconsColors()
        }
    }
    var color: Configuration.Color = .green {
        didSet {
            updateButtonColors()
        }
    }
    var size: Configuration.Size = .regular {
        didSet {
            height = Self.height(forSize: size)
        }
    }
    
    var onTap: (() -> ())?
    
    private var height: CGFloat = 44
    private var leftImageView: UIImageView?
    private var rightImageView: UIImageView?
    private let button = CustomColorButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override public var backgroundColor: UIColor? {
        get {
            return button.backgroundColor
        } set {
            Self.logger.warning("An attempt to change BrandButton background color has no effect.")
        }
    }
    
    override public var tintColor: UIColor! {
        didSet {
            updateIconsColors()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: height)
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        invalidateIntrinsicContentSize()
    }
}

private extension BrandButton {
    func commonInit() {
        height = Self.height(forSize: size)
        label = "Brand Button"
        
        addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        updateButtonColors()
        updateContentInsets()
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        onTap?()
    }
}

// MARK: - Auxiliaries

private extension BrandButton {
    func updateButtonColors() {
        let provider = BrandButtonColorsProvider(variant: variant, color: color)
        
        button.setBackgroundColor(provider.defaultBackground(), forState: .normal)
        button.setBackgroundColor(provider.pressedBackground(), forState: .highlighted)
        button.setBackgroundColor(provider.disabledBackground(), forState: .disabled)
        
        button.setTitleColor(provider.defaultTitle(), for: .normal)
        button.setTitleColor(provider.pressedTitle(), for: .highlighted)
        button.setTitleColor(provider.disabledTitle(), for: .disabled)
        
        button.setBorderColor(provider.defaultBorder(), forState: .normal)
        button.setBorderColor(provider.pressedBorder(), forState: .highlighted)
        button.setBorderColor(provider.disabledBorder(), forState: .disabled)
    }
    
    func updateIconsColors() {
        let iconColor: UIColor
        if isEnabled {
            iconColor = tintColor
        } else {
            iconColor = BrandButtonColorsProvider(variant: variant, color: color).disabledTitle()
        }
        leftImageView?.tintColor = iconColor
        rightImageView?.tintColor = iconColor
    }
    
    func updateLeftIcon() {
        if let leadingIcon = leadingIcon {
            let imageView = UIImageView(image: leadingIcon)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            button.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.leftAnchor.constraint(equalTo: button.leftAnchor, constant: 16),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: Constants.iconSize),
                imageView.heightAnchor.constraint(equalToConstant: Constants.iconSize)
            ])
            leftImageView = imageView
        } else {
            leftImageView?.removeFromSuperview()
            leftImageView = nil
        }
        updateContentInsets()
    }
    
    func updateRightIcon() {
        if let trailingIcon = trailingIcon {
            let imageView = UIImageView(image: trailingIcon)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            button.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -16),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: Constants.iconSize),
                imageView.heightAnchor.constraint(equalToConstant: Constants.iconSize)
            ])
            rightImageView = imageView
        } else {
            rightImageView?.removeFromSuperview()
            rightImageView = nil
        }
        updateContentInsets()
    }
    
    func updateContentInsets() {
        var leftContentInset = Constants.padding
        if leadingIcon != nil {
            leftContentInset += Constants.iconSize + Constants.iconGap
        }
        
        var rightContentInset = Constants.padding
        if trailingIcon != nil {
            rightContentInset += Constants.iconSize + Constants.iconGap
        }
        
        let i = button.contentEdgeInsets
        button.contentEdgeInsets = UIEdgeInsets(top: i.top, left: leftContentInset, bottom: i.bottom, right: rightContentInset)
        button.titleLabel?.font = UIFont(name: "ProximaNova-Bold", size: 15)
        button.layer.cornerRadius = 4
    }
    
    static func height(forSize size: Configuration.Size) -> CGFloat {
        switch size {
        case .regular: return 44
        }
    }
}
