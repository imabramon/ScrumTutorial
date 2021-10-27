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
                Text("Seconds elapsed")
                Text("Seconds remaining")
            }
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
