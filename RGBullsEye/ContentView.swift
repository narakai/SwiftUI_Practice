//
//  ContentView.swift
//  RGBullsEye
//
//  Created by lailiang on 2020/1/15.
//  Copyright © 2020 Narakai Studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timer = TimeCounter()
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)

    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0)
                    Text("Match this color")
                }
                VStack {
                    ZStack {
                        Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0)
                        Text(String(timer.counter))
                            .padding(.all, 5)
                            .background(Color.white)
                            .mask(Circle())
                            .foregroundColor(.black)
                    }
                    Text("R: \(Int(rGuess * 255.0))")
                    Text("G: \(Int(gGuess * 255.0))")
                    Text("B: \(Int(bGuess * 255.0))")
                }
            }
            
            Text("Hit me button")
            
            VStack {
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
        Slider(value:$value).background(textColor).cornerRadius(10)
            Text("255").foregroundColor(.red)
        }.padding()
    }
}
