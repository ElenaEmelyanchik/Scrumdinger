//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 26/06/2024.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else { return 1}
        return Double(secondsElapsed)/Double(totalSeconds)
    }
    
    private var minutesRemaining: Int{
        secondsRemaining/60
    }
    var body: some View {
        VStack{
            HStack{
                ProgressView(value: progress)
            }.padding(4).background(.black)
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                    
                }
                
            }
        }
        .accessibilityElement(children: /*@START_MENU_TOKEN@*/.ignore/*@END_MENU_TOKEN@*/)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding(16)
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 3,
                      secondsRemaining: 200,
                      theme: DailyScrum.sampleData[0].theme).previewLayout(.sizeThatFits)
}
