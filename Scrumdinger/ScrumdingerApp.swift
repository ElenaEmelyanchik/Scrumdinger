//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 27/05/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
