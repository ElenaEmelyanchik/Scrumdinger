//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 02/10/2024.
//

import Foundation

struct ErrorWrapper: Identifiable{
    let id: UUID = UUID()
    let error: Error
    let guidance: String
    
    init(error: Error, guadence: String) {
        self.error = error
        self.guidance = guadence
    }
}
