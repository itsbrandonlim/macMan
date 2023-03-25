//
//  Loading Screen.swift
//  test pacman
//
//  Created by Febrian Daniel on 22/03/23.
//

import SwiftUI


struct Loading_Screen: View {
    
    @Binding var currentDisplayScreen: DisplayScreen
    
    @State var isShowingPopUp = false
//    @State var macMan: MacManSession?
    @State var username = ""
    
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 8){
                Text("Mac-Man")
                    .font(.custom("Retro Gaming", size: 90))
                    .padding()
                Spacer()
                    .frame(height: 100)
                
                AnimationView()
                    .frame(width: 1200, height: 80)
                
                Spacer()
                    .frame(height: 100)
                HStack{
                    Text("Username: ")
                        .font(.custom("Retro Gaming", size: 12))
                    TextField("Username", text: $username)
                        .frame(width: 200.0)
                        .font(.custom("Retro Gaming", size: 12))
                        .padding()
                        .foregroundColor(.white)
                        .textFieldStyle(.roundedBorder)
                }
                
                Button{
//                    macMan = MacManSession(username: username)
                    self.currentDisplayScreen = .maze
                    isShowingPopUp = true
                }label: {
                    Text("ENTER")
                        .frame(width: 170, height: 50)
                        .font(.custom("Retro Gaming", size: 25))
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .padding()
                .buttonStyle(.plain)
//                .sheet(isPresented: $isShowingPopUp){
//                    Pairing(currentDisplayScreen: $currentDisplayScreen).environmentObject(macMan!)
//                }
                
                Spacer()
                    .frame(height: 50)
            }
        }
    }
}

struct Loading_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Loading_Screen(currentDisplayScreen: .constant(.loadingScreen))
    }
}
