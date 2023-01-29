//
//  ContentView.swift
//  watchOS Watch App
//
//  Created by Jacobo de Juan Millon on 2023-01-29.
//

import SwiftUI

struct ContentView: View {

    // Make an instance of the view model to store questions and advice
    @StateObject private var advisor = AdviceViewModel()

    // Stores the current question being asked
    @State private var input = ""
    
    // Stores the response to the given question
    @State private var output = ""
    
    var body: some View {
        VStack {
            TextField("Question",
                      text: $input,
                      prompt: Text("Ask a question"))

            // Get advice
            Button(action: {
                print("Shake button was pressed")
                output = advisor.provideResponseFor(givenQuery: input)
            }, label: {
                Text("Shake")
            })

            // Advice given
            Text(output)
                .multilineTextAlignment(.center)
                // Multiple lines as needed
                .fixedSize(horizontal: false, vertical: true)
            
        }
        .navigationTitle("Magic 8 Ball")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
