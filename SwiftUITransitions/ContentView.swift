//
//  ContentView.swift
//  SwiftUITransitions
//
//  Created by ramil on 06.08.2020.
//

import SwiftUI

struct MyText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
    }
    
    init(_ text: String) { self.text = text }
}

struct ContentView: View {
    @State var isOn = true
    
    var body: some View {
        VStack {
            if isOn {
                Spacer()
                
                MyText("Slide").transition(.slide)
                
                MyText("Opacity").transition(.opacity)
                
                MyText("Scale").transition(.scale)
                
                MyText("Move bottom").transition(.move(edge: .bottom))
                
                MyText("Offset (50, 50)").transition(.offset(x: 50, y: 50))
                
                MyText("Slide in scale out").transition(.asymmetric(insertion: .slide, removal: .scale))
                
                MyText("Slide and opacity").transition(AnyTransition.slide.combined(with: .opacity))
            }
            
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 2)) {
                    self.isOn.toggle()
                }
            }, label: {
                Text("Toggle").font(.largeTitle)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
