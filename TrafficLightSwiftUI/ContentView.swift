//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Камаль Атавалиев on 22.04.2023.
//

import SwiftUI

enum trafficLightStates {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var redLightOpacity = 0.3
    @State private var yellowLightOpacity = 0.3
    @State private var greenLightOpacity = 0.3
    
    @State var trafficLightStateCurrent = trafficLightStates.red
    @State var trafficLightStateOn = 1.0
    @State var trafficLightStateOff = 0.3
    
    @State var buttonTitle = "Start"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack (spacing: 20){
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.red)
                    .opacity(redLightOpacity)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.yellow)
                    .opacity(yellowLightOpacity)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.green)
                    .opacity(greenLightOpacity)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                
                Spacer()
                
                Button(action: StartButtonPressed) {
                    ZStack{
                        Capsule()
                            .frame(width: 150, height: 50)
                            .overlay(Capsule().stroke(Color.white, lineWidth: 4))
                        Text(buttonTitle)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
            } .padding()
        }
    }
    
    private func StartButtonPressed() { // Изначально хотел назвать changeCurrеntColor, но пришлось добавить сюда смену текста кнопки, поэтому "одна функция одно действие" уже не получалось, решил назвать метод так, якобы что будет происходить по нажатию на кнопку как в UIKit
        
        if buttonTitle == "Start" {
            buttonTitle = "Next"
        }
        
        switch trafficLightStateCurrent {
        case .red:
            redLightOpacity = trafficLightStateOn
            greenLightOpacity = trafficLightStateOff
            trafficLightStateCurrent = trafficLightStates.yellow
        case .yellow:
            redLightOpacity = trafficLightStateOff
            yellowLightOpacity = trafficLightStateOn
            trafficLightStateCurrent = trafficLightStates.green
        case .green:
            yellowLightOpacity = trafficLightStateOff
            greenLightOpacity = trafficLightStateOn
            trafficLightStateCurrent = trafficLightStates.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
