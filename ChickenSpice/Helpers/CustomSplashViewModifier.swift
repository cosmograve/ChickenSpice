
import SwiftUI

struct CustomSplashViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color(.back)
                .ignoresSafeArea()
            content
                .padding(16)
        }
    }
}

extension View {
    func modifyView() -> some View {
        modifier(CustomSplashViewModifier())
    }
}
