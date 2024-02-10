//
//  ContentView.swift
//  Balance
//
//  Created by Ilnur Shabanov on 08.02.2024.
//

import SwiftUI

struct ContentView: View {
  @State private var showEventEditView = false
  var body: some View {
    VStack {
      Button(action: { showEventEditView = true }, label: {
        Text("New Event")
          .foregroundColor(.white)
          .padding()
          .background(Color.blue)
          .cornerRadius(10)
      })
    }
    .sheet(isPresented: $showEventEditView, content: {
      EventEditView()
    })
    .padding()
  }
}

#Preview {
    ContentView()
}
