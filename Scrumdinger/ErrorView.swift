//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 02/10/2024.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("An error has occured!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button("Dismiss"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error{
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper{
        ErrorWrapper(
            error: SampleError.errorRequired,
            guadence: "Preview Error"
        )
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
