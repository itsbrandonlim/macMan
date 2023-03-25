//
//  ToD2.swift
//  mac-man
//
//  Created by Femi Rachma Pertiwi on 25/03/23.
//

import SwiftUI

struct ToD2: View {
    var Truth = ["Mention your favorite mentor!", "Who's your new best friend in the Academy?", "Who's the most handsome/beautiful learner in the Academy?", "Who's a learner/mentor with scary first impression?", "What's your impression and message after studying in the Academy for 2 weeks?"]
    var Dare = ["Give one compliment to one mentor (your opposite gender)!", "Give one compliment to one learner (your opposite gender)!", "Take a group selfie with several people!", "Sing one song!", "Take a selfie with your plant to show it off!"]

    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Group {
                    Text("CHOOSE!")
                        .font(.custom("Retro Gaming", size: 30))
                        .foregroundColor(Color.yellow)
                    Spacer() /// forces content to top
                    
                    Text("TRUTH")
                        .font(.custom("Retro Gaming", size: 20))
                        .foregroundColor (Color.white)
                        .frame(width: 100, height: 30)
                        .background(Color.blue)
                        .padding(5)
                    Text(Truth[Int.random(in: 0..<Truth.count)])
                        .font(.custom("Retro Gaming", size: 12))
                        .foregroundColor (Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                        
                    Spacer()
                    Text("OR")
                        .font(.custom("RetroGaming", size: 25))
                }
                Group {
                    Text("DARE")
                        .font(.custom("Retro Gaming", size: 20))
                        .foregroundColor(Color.white)
                        .frame(width: 90, height: 30)
                        .background (Color.red)
                        .padding(5)
                    
                    Text(Dare[Int.random(in: 0..<Dare.count)])
                        .font(.custom("Retro Gaming", size: 12))
                        .foregroundColor (Color.white)
                        .multilineTextAlignment(.center)
                     }
                Spacer()
                Spacer()
                
                HStack {
                    Image("Macman half open")
                        .resizable()
                        .frame(width: 100, height: 50)
//                    Spacer(1)
                    Text("Thank you for your efforts! Good job!")
                        .font(.custom("Retro Gaming", size: 12))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 310, height: 30)
                        .background (Color.white)
                        
                }
                Spacer()
            }
            
            
        }
        .padding()
        .onAppear{
            MusicPlayer.shared.startBackgroundMusic()
        }
    }
}

struct ToD2_Previews: PreviewProvider {
    static var previews: some View {
        ToD2()
    }
}
