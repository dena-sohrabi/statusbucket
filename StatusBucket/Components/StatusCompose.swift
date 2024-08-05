import DesignSystem
import SwiftUI

struct Item: Hashable {
    let title: String
}

public struct StatusCompose: View {
    @Binding var statusText: String
    @State private var selection: Item? = nil
    let items = [
        Item(title: "Friends"),
        Item(title: "Only Me"),
        Item(title: "Public"),
    ]

    public init(statusText: Binding<String>) {
        _statusText = statusText
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField(text: $statusText, axis: .vertical) {
                Text("What's on your mind at the moment?")
            }
            .font(.body)
            .frame(minHeight: 50, alignment: .top)
            .padding(.bottom, 2)
            .textFieldStyle(PlainTextFieldStyle())
            HStack(alignment: .center, spacing: 2, content: {
                ComposeMenu(
                    items: items,
                    selection: $selection,
                    titleForItem: { $0.title }
                )
                ComposeButton(
                    title: "Current browser tab",
                    icon: "square.and.arrow.up",
                    action: {}
                )
                ComposeButton(
                    title: "Clipboard",
                    icon: "clipboard",
                    action: {}
                )
            })
        }
        .padding(12)
        .background(DesignSystem.composeBg)
        .cornerRadius(12)
        .shadow(color: .primary.opacity(0.06), radius: 3, x: 0, y: 3)
        .shadow(color: .primary.opacity(0.04), radius: 0, x: 2, y: 2)
        .shadow(color: .primary.opacity(0.04), radius: 0, x: -2, y: -2)
        .shadow(color: .primary.opacity(0.04), radius: 0, x: 2, y: -2)
        .shadow(color: .primary.opacity(0.04), radius: 0, x: -2, y: 2)
    }
}

#Preview {
    ZStack {
        @State var text: String = ""
        Color.white.opacity(0.8).edgesIgnoringSafeArea(.all)
        StatusCompose(statusText: $text)
            .padding(16)
    }
}
