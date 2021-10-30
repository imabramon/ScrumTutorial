//
//  ScrumApp.swift
//  Scrum
//
//  Created by Влад Шелопугин on 27.10.2021.
//

import SwiftUI

@main
struct ScrumApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
