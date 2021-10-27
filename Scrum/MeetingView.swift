//
//  ContentView.swift
//  Scrum
//
//  Created by Влад Шелопугин on 27.10.2021.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5.0, total: 15)
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            HStack{
                Text("Speaker 1 of 3")
                Button(action: {}){
                    Image(systemName: "forward.fill")
                }
            }
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
