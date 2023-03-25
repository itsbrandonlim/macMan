//
//  ContentView.swift
//  mac-man
//
//  Created by Brandon Nicolas Marlim on 21/03/23.
//

//problem 1: double button
//di cek parameternya milik siapa
import SwiftUI
import PureSwiftUI
import AppKit
import WebKit

struct AnimationView: NSViewRepresentable {
    
    typealias NSViewType = NSView

    func makeNSView(context: Context) -> NSView {
        
        let view = NSView()
         
        let imageView = NSImageView()
        var imageIndex = 0
        
        
        imageView.frame = NSRect(x: 0, y: 0, width: 100, height: 110)
        imageView.image = NSImage(named: "Macman close")
        
        view.addSubview(imageView)
        
        let images = ["Macman close", "Macman half open", "Macman open"].compactMap { NSImage(named: $0) }
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            
            imageIndex = (imageIndex + 1) % images.count
            let image = images[imageIndex]
            imageView.image = image
            
            let newX = imageView.frame.origin.x + 10
            let newY = imageView.frame.origin.y
            let newFrame = NSRect(x: newX, y: newY, width: imageView.frame.width, height: imageView.frame.height)
            imageView.frame = newFrame
        }
        
        
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
    }
}

enum DisplayScreen{
    case loadingScreen
//    case pairing
    case maze
//    case truthOrDare
}

struct ContentView: View {
    
    @State var currentDisplayScreen: DisplayScreen = .loadingScreen
//    @State var macMan: MacManSession?
    
    var body: some View {
    
        switch currentDisplayScreen {
        case .loadingScreen:
            Loading_Screen(currentDisplayScreen: $currentDisplayScreen)
//        case .pairing:
//            Pairing(currentDisplayScreen: $currentDisplayScreen)
//                .environmentObject(macMan!)
        case .maze:
            Maze(currentDisplayScreen: $currentDisplayScreen)
//        case .truthOrDare:
//            Truth_Or_Dare()
        }
//        VStack {
//
//            Text("Mac-Man")
//                .font(.custom("Retro Gaming", size: 70))
//                .foregroundColor(Color.white)
//
//            AnimationView()
////                .aspectRatio(contentMode: .fit)
//                .frame(width: 600, height: 80)
////    NSViewRepresentableWrapper(viewController.view)
////                            .frame(width: 100, height: 100)
//
//            Button {
//                print("")
//
//            } label: {
//                Text("Enter")
//                    .font(.custom("Retro Gaming", size: 15))
//                    .frame(width: 100, height:30)
//                    .foregroundColor(.black)
//            }
////            .background{
////                Color.white
////            }
//            .background(.white)
//            .cornerRadius(12)
//
//
//
//
//
//
//        }
//
//        .padding()


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







