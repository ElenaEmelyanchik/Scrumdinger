//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Elena Vasilenko on 29/05/2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State var editedScrum: DailyScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    var body: some View {
        List{
            Section(header: Text("Meeting info")){
                NavigationLink(
                destination: MeetingView(scrum: $scrum)){
                Label("Start meeting", systemImage: "timer").font(.headline).foregroundColor(.accentColor)}
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }.accessibilityElement(children: .combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)").padding(4).foregroundColor(scrum.theme.accentColor).background(scrum.theme.mainColor).cornerRadius(4)
                }.accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){ attendee in
                    Label(attendee.name, systemImage: "person")
                    
                }
            }
            
            Section(header: Text("History")){
                if scrum.history.isEmpty{
                    Label("No meeting yer", systemImage:"calendar.badge.exclamationmark")
                }
                ForEach(scrum.history){ history in
                    HStack{
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }.navigationTitle(scrum.title).sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack{
                DetailEditView(emptyScrum: $editedScrum).navigationTitle(scrum.title).toolbar(content: {
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            isPresentingEditView = false
                        }
                        
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Done"){
                            isPresentingEditView = false
                            scrum = editedScrum
                        }
                    }
                })
            }
        }).toolbar{
            Button(action: {
                isPresentingEditView = true
                editedScrum = scrum
            }){
                Text("Edit")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
