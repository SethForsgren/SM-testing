//
//  ContentView.swift
//  SM-testing
//
//  Created by Seth Forsgren on 3/11/21.
//

import SwiftUI
import Combine
import SwiftMessages

struct ContentView: View {
  var body: some View {
    Text("Hello, world!")
      .padding()
    Button("Show Message Once") {
      showTestMessage()
    }
    .padding()
    Button("Show Message Once, and again in 3 seconds") {
      // First show
      showTestMessage()
      print("DISMISS OR TAP ON MESSAGE NOW")
    
      
      // Second show
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("SOMETHING HAPPENED 3 SECONDS LATER")
        showTestMessage()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

func showTestMessage() {
  print("Show Message")
  // Hide the previous message if any exists
  SwiftMessages.hide(animated: false)
  
  // Ensure no delay in showing subsequent messages
  SwiftMessages.pauseBetweenMessages = 0.0
  
  // configure messages to show if same user repeatedly taps
  var config = SwiftMessages.Config()
  config.ignoreDuplicates = false
  
  // Instantiate a message view from the centeredview layout in resources
  let view = MessageView.viewFromNib(layout: .centeredView)

  // Theme message elements
  let backgroundColor = UIColor.systemGray5
  let foregroundColor = UIColor.label
  view.configureTheme(backgroundColor: backgroundColor, foregroundColor: foregroundColor)
  
  // Set message title, body
  view.configureContent(title: "Hello", body: "This is my message")
  
  // Increase the external margin around the card
  view.layoutMarginAdditions = UIEdgeInsets(top: 8, left: 72, bottom: 0, right: 72)
  
  // Reduce the corner radius
  (view.backgroundView as? CornerRoundingView)?.cornerRadius = 14
  
  // React when message view is tapped by navigating to the right channel view in our app
  view.tapHandler = {
    _ in
    
    SwiftMessages.hide()
  }
  // Show the message
  SwiftMessages.show(config: config, view: view)
}
  
