//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 27/05/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
