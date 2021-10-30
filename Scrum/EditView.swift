//
//  EditView.swift
//  Scrum
//
//  Created by Влад Шелопугин on 30.10.2021.
//

import SwiftUI

struct EditView: View {
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    var body: some View {
        List{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $scrumData.title)
                HStack{
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0){
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                }
                ColorPicker("Color", selection: $scrumData.color)
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
            .preferredColorScheme(.dark)
    }
}
