//
//  macManAnimate.swift
//  mac-man
//
//  Created by Brandon Nicolas Marlim on 22/03/23.
//
import SwiftUI
import AppKit

class ViewController: NSViewController {
    
    let imageView = NSImageView()
    var imageIndex = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = NSRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = NSImage(named: "image0")
        view.addSubview(imageView)
        
        let images = ["macman close", "macman half open", "macman oepn", "macman close"].compactMap { NSImage(named: $0) }
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.imageIndex = (self.imageIndex + 1) % images.count
            let image = images[self.imageIndex]
            self.imageView.image = image
            
            let newX = self.imageView.frame.origin.x + 10
            let newY = self.imageView.frame.origin.y
            let newFrame = NSRect(x: newX, y: newY, width: self.imageView.frame.width, height: self.imageView.frame.height)
            self.imageView.frame = newFrame
        }
    }
    
}
