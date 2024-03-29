//
//  EventEditView.swift
//  Balance
//
//  Created by Ляхевич Александр Олегович on 10.02.2024.
//

import SwiftUI
import EventKitUI

struct EventEditView: UIViewControllerRepresentable {
  @Environment(\.presentationMode) var presentationMode
  typealias UIViewControllerType = EKEventEditViewController
  
//  @Binding var event: EKEvent?
  let eventStore = EKEventStore()
  
  /// Create an event edit view controller, then configure it with the specified event and event store.
  func makeUIViewController(context: Context) -> EKEventEditViewController {
      let controller = EKEventEditViewController()
      controller.eventStore = eventStore
//      controller.event = event
      controller.editViewDelegate = context.coordinator
      return controller
  }
  
  func updateUIViewController(_ uiViewController: EKEventEditViewController, context: Context) {
  }
  
  func makeCoordinator() -> Coordinator {
      return Coordinator(self)
  }
  
  class Coordinator: NSObject, EKEventEditViewDelegate {
      var parent: EventEditView
      
      init(_ controller: EventEditView) {
          self.parent = controller
      }
      
      func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
          parent.presentationMode.wrappedValue.dismiss()
      }
  }
}

