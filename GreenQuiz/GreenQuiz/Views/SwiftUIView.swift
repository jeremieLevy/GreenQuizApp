//
//  SwiftUIView.swift
//  GreenQuiz
//
//  Created by Jessy Viranaiken on 03/07/2024.
//

import SwiftUI
import ConfettiSwiftUI

struct SwiftUIView: View {
  
  @State private var counter: Int = 0
  
  var body: some View {
    Button("🎉") {
      counter += 1
    }
    .confettiCannon(counter: $counter, confettis: [.text("🍃")], colors: [.primaryApp], confettiSize: 20, repetitions: 2, repetitionInterval: 0.7)
  }
}

#Preview {
    SwiftUIView()
}

