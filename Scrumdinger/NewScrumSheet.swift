//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 15/09/2024.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    var body: some View {
        NavigationStack{
            DetailEditView(emptyScrum: $newScrum)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(
        isPresentingNewScrumView: .constant(true),
        scrums: .constant(DailyScrum.sampleData)
    )
}
