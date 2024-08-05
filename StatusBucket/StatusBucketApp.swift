//
//  StatusBucketApp.swift
//  StatusBucket
//
//  Created by Dena Sohrabi on 8/4/24.
//

import SwiftUI

@main
struct StatusBucketApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            window.setContentSize(NSSize(width: 550, height: 600))
            window.makeKeyAndOrderFront(nil)
        }
    }
}
