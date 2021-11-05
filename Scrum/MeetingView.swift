//
//  ContentView.swift
//  Scrum
//
//  Created by Влад Шелопугин on 27.10.2021.
//

import SwiftUI

struct MeetingView: View {
    @Binding var scrum : DailyScrum
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack {
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                HStack{
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel(Text("Next speaker"))
                }
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
            .preferredColorScheme(.dark)
    }
}
