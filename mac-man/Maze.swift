//
//  maze view.swift
//  test pacman
//
//  Created by Febrian Daniel on 21/03/23.
//

import SwiftUI

struct Maze: View {
    
    @Binding var currentDisplayScreen: DisplayScreen
    
    @State private var timeRemaining = 180
    @State private var isTimerRunning = false
    let timers = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var timeFormat: String {
        let minute = timeRemaining / 60
        let second = timeRemaining % 60
        return String(format: "%02d:%02d", minute, second)
    }
    
//    @Environment(\.scenePhase) var scenePhase
//    @State private var isActive = true
    
    var body: some View {
        
        ZStack {
            Color.black
            VStack {
                Rectangle()
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.brown)
                    .opacity(0.3)
                HStack {
                    Image("heart - black").resizable(capInsets: EdgeInsets()).frame(width: 80.0, height: 60.0)
                    Image("heart - black").resizable(capInsets: EdgeInsets()).frame(width: 80.0, height: 60.0)
                    Spacer()
                    Text(timeFormat)
                        .font(.custom("Retro Gaming", size: 30))
                        .foregroundColor(.white)
                        .padding(.trailing)
                }
                
//                .onReceive(timers){ time in
//                        if timeRemaining > 0{
//                            timeRemaining -= 1
//                        }
//                    }
                .onAppear(){
                    NSEvent.addLocalMonitorForEvents(matching: .keyDown){ event in
                        if !isTimerRunning {
                            if event.keyCode == 123 || event.keyCode == 124 || event.keyCode == 125 || event.keyCode == 126 {
                                startTimer()
                            }
                        }
                        return event
                    }
                }
//                .onAppear(){
//                    NSApp.keyWindow?.makeFirstResponder(KeyResponder())
//                }
                
//                .onChange(of: scenePhase) { newPhase in
//                    if newPhase == .active {
//                        isActive = true
//                    } else {
//                        isActive = false
//                    }
//                }
                
            }
            .padding()
        }
    }
    func startTimer(){
        isTimerRunning = true
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                isTimerRunning = false
            }
        }
    }
}

struct Maze_Previews: PreviewProvider {
    static var previews: some View {
        Maze(currentDisplayScreen: .constant(.maze))
    }
}
