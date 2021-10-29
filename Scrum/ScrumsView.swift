//
//  ScrumsView.swift
//  Scrum
//
//  Created by Влад Шелопугин on 29.10.2021.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        List{
            ForEach(scrums){ scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
            .preferredColorScheme(.dark)
    }
}
