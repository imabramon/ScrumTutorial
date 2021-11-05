//
//  MeetingHeaderView.swift
//  Scrum
//
//  Created by Влад Шелопугин on 06.11.2021.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    private var progress: Double {
        guard secondsRemaining > 0 else {return 1}
        let totalSeconds = Double(secondsElapsed + secondsRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    private var minutesRemaining: Int{
        secondsRemaining / 60
    }
    private var minutesRemainingMetric: String{
        minutesRemaining == 1 ? "minute" : "minutes"
    }
    
    var body: some View {
        VStack{
            ProgressView(value: progress)
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time remaining"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutesRemainingMetric)"))
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
