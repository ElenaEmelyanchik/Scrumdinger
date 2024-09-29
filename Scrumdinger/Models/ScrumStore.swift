//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 29/09/2024.
//
import SwiftUI

class ScrumStore: ObservableObject{
    @Published var scrums: [DailyScrum] = []
}
