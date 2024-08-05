import DesignSystem
import SwiftUI

struct ComposeMenu<T: Hashable>: View {
    let items: [T]
    @Binding var selection: T?
    let titleForItem: (T) -> String

    var body: some View {
        Menu {
            ForEach(items, id: \.self) { item in
                Button(action: {
                    selection = item
                }) {
                    Text(titleForItem(item))
                }
                .buttonStyle(CustomMenuItemStyle())
            }
        } label: {
            Text(selection.map(titleForItem) ?? "Friends")
                .foregroundColor(.blue)
                .font(.callout)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 8)
        .frame(height: 28)
        .background(.blue.opacity(0.08))
        .cornerRadius(8)
        .fixedSize()
        .menuStyle(CustomMenuStyle())
    }
}

struct CustomMenuItemStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
    }
}

struct CustomMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .menuIndicator(.hidden)
            .menuStyle(.borderlessButton)
    }
}

struct ExampleItem: Hashable {
    let title: String
}

struct ComposeMenuPreview: View {
    @State private var selection: ExampleItem?
    let items = [
        ExampleItem(title: "Friends"),
        ExampleItem(title: "Only Me"),
        ExampleItem(title: "Public"),
    ]

    var body: some View {
        VStack {
            ComposeMenu(
                items: items,
                selection: $selection,
                titleForItem: { $0.title }
            )
        }
        .frame(width: 200, height: 100)
        .background(Color(white: 0.95)) // Light gray background
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 8)
            .frame(height: 28)
            .background(configuration.isPressed ? DesignSystem.text6.opacity(0.3) : .clear)
            .cornerRadius(8)
            .fixedSize()
            .animation(.bouncy(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    ComposeMenuPreview()
}

struct ComposeButton: View {
    var title: String
    var icon: String
    var action: () -> Void
    init(title: String, icon: String, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button(action: {
        }, label: {
            HStack(alignment: .center) {
                Image(systemName: icon)
                    .font(.callout)
                    .foregroundColor(DesignSystem.text5)
                    .fontWeight(.medium)
                Text(title)
                    .font(.callout)
                    .foregroundColor(DesignSystem.text4)
                    .fontWeight(.medium)
            }
        })
        .buttonStyle(CustomButtonStyle())
    }
}

#Preview {
    VStack {
        ComposeButton(
            title: "Current browser tab",
            icon: "square.and.arrow.up",
            action: {}
        )
    }
    .frame(width: 200, height: 100)
}
