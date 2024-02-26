import SwiftUI
import BrandButton

struct BrandButtonWithSwiftUIView: View {
    @State var isLeftAlignedButtonEnabled: Bool = true
    
    var body: some View {
        Spacer()
        VStack {
            HStack {
                Toggle("", isOn: $isLeftAlignedButtonEnabled).frame(width: 46)
                Text("Button enabled").padding()
                Spacer()
            }
            HStack {
                BrandButtonRepresentable("Aligned to Left", leadingIcon: UIImage(systemName: "heart.fill")!, isEnabled: $isLeftAlignedButtonEnabled, onTap: { print("Button 'Aligned to Left' tapped") }).fixedSize().tint(.pink)
                Spacer()
            }
            HStack {
                Spacer()
                BrandButtonRepresentable("Aligned to Right", color: .blue, trailingIcon: UIImage(systemName: "heart.fill")!, onTap: { print("Button 'Aligned to Right' tapped") }).fixedSize().tint(.pink)
            }
            HStack {
                Spacer()
                BrandButtonRepresentable("Aligned to Center", variant: .secondary, onTap: { print("Button 'Aligned to Center' tapped") }).fixedSize()
                Spacer()
            }
            HStack {
                BrandButtonRepresentable("Full Width", variant: .secondary, color: .blue, onTap: { print("Button 'Full Width' tapped") })
            }
        }.padding()
        Spacer()
    }
}

#Preview {
    BrandButtonWithSwiftUIView()
}
