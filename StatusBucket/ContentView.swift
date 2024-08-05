//
//  ContentView.swift
//  StatusBucket
//
//  Created by Dena Sohrabi on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        VStack {
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .top) {
            StatusCompose(statusText: $text)
                .padding(16)
        }
    }
}

#Preview {
    ContentView()
}
