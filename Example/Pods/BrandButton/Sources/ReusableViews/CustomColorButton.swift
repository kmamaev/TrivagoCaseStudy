import UIKit

final class CustomColorButton: UIButton {
    private enum Constants {
        static let animationDuration: Double = 0.1
    }
    
    enum State {
        case normal
        case highlighted
        case disabled
    }
    
    override var isHighlighted: Bool {
        didSet {
            buttonState = isHighlighted ? .highlighted : .normal
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            buttonState = isEnabled ? .normal : .disabled
        }
    }
    
    private var buttonState: State = .normal {
        didSet {
            UIView.animate(withDuration: Constants.animationDuration) {
                self.updateBackgroundColor()
                self.updateBorderColor()
            }
        }
    }
    
    private var backgroundColors: [State: UIColor] = [:]
    private var borderColors: [State: UIColor] = [:]
    private var titleColors: [State: UIColor] = [:]
    
    func setBackgroundColor(_ color: UIColor?, forState state: State) {
        backgroundColors[state] = color
        if state == self.buttonState {
            updateBackgroundColor()
        }
    }
    
    func setBorderColor(_ color: UIColor?, forState state: State) {
        borderColors[state] = color
        if state == self.buttonState {
            updateBorderColor()
        }
    }
}

private extension CustomColorButton {
    func updateBackgroundColor() {
        layer.backgroundColor = backgroundColors[buttonState]?.cgColor
    }
    
    func updateBorderColor() {
        let borderEnabled = borderColors[buttonState] != nil
        layer.borderWidth = borderEnabled ? 1 : 0
        layer.borderColor = borderColors[buttonState]?.cgColor
    }
}
