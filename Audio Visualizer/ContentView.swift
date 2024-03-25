//
//  ContentView.swift
//  Audio Visualizer
//
//  Created by Arun Rathore on 25/03/24.
//

import SwiftUI

struct ContentView: View {

    @State private var drawingHeight = true

    var animation: Animation {
        return .linear(duration: 0.5).repeatForever()
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Audio Visualizer")
                .bold()
            HStack {
                bar(low: 0.4)
                    .animation(animation.speed(1.5), value: drawingHeight)
                bar(low: 0.3)
                    .animation(animation.speed(1.2), value: drawingHeight)
                bar(low: 0.5)
                    .animation(animation.speed(1.0), value: drawingHeight)
                bar(low: 0.3)
                    .animation(animation.speed(1.7), value: drawingHeight)
                bar(low: 0.5)
                    .animation(animation.speed(1.0), value: drawingHeight)
            }
            .frame(width: 80, alignment: .center)

            .onAppear{
                drawingHeight.toggle()
            }
        }
    }

    func bar(low: CGFloat = 0.0, high: CGFloat = 1.0) -> some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(.cyan)
            .frame(height: (drawingHeight ? high : low) * 50)
            .frame(height: 50, alignment: .bottom)
    }
}

#Preview {
    ContentView()
}
