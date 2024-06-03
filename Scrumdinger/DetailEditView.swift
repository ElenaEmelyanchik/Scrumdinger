//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 03/06/2024.
//

import SwiftUI

struct DetailEditView: View {
    @State private var emptyScrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    var body: some View {
        Form{
            Section(header: Text("Meeting info")){
                TextField("Title", text: $emptyScrum.title)
                HStack{
                    Slider(value: $emptyScrum.lengthInMinutesAsDouble, in: 5...30, step: 1){
                        Text("Length")
                    }.accessibilityValue("\(emptyScrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(emptyScrum.lengthInMinutes) minutes").accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }
            Section(header: Text("Attendees")){
                ForEach(emptyScrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete{ indices in
                    emptyScrum.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation{
                            let newAttendee = DailyScrum.Attendee(name: newAttendeeName)
                            emptyScrum.attendees.append(newAttendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill").accessibilityLabel("Add attendee")
                    }.disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
