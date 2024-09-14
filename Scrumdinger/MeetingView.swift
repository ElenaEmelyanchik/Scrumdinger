//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 27/05/2024.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16.0).fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(100, 200)
                Circle().strokeBorder(lineWidth: 24)
                HStack{
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "forward.fill")
                    }.accessibilityLabel("Next speaker")
                }
                
            }
        }.padding().foregroundColor(scrum.theme.accentColor).navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
