//
//  DetailView.swift
//  Scrum
//
//  Created by Влад Шелопугин on 29.10.2021.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var data: DailyScrum.Data = DailyScrum.Data() 
    @State private var isPressented = false
    
    var body: some View {
        List{
            Section(header: Text("Meeting info")){
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityLabel(Text("Start meeting"))
                }
                HStack{
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack{
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees, id: \.self){ attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text("\(attendee)"))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
        .navigationBarItems(trailing: Button("Edit"){
            isPressented = true
            data = scrum.data
        })
        .fullScreenCover(isPresented: $isPressented){
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Canel"){
                        isPressented = false
                    }, trailing: Button("Done"){
                        isPressented = false
                        scrum.update(from: data)
                    })
                    .preferredColorScheme(.dark)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
                .preferredColorScheme(.dark)
        }
    }
}
