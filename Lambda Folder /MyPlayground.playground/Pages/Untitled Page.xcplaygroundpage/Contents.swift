import Cocoa

import Foundation

extension DispatchQueue {
    /// Submits closure to global queue (not main) after a delay in seconds
    public static func async(after delay: Double = 0.0, _ action: @escaping () -> Void) {
        global().asyncAfter(deadline:  .now() + delay, execute: action)
    }
    
    /// Submits closure to main queue after a delay in seconds
    public static func asyncMain(after delay: Double = 0.0, _ action: @escaping () -> Void) {
        main.asyncAfter(deadline:  .now() + delay, execute: action)
    }
}

// DispatchQueue.main <--
// DispatchQueue.global <-- created

import PlaygroundSupport

// Until we tell the playground to stop it will run forever

PlaygroundPage.current.needsIndefiniteExecution = true

print("Starting")
//DispatchQueue.async(after: 4.0) {
  //  print("another hello")
//}

//DispatchQueue.async(after: 4.0) {
    //print("Hello")
//}

for index in 1 ... 10 {
    DispatchQueue.async(after: 2.0) { print("Reached \(index)")}
}

import AVKit

class Sound: NSObject {
    private static var player: AVPlayer = AVPlayer()
    static func play() {
        let path = Bundle.main.path(forResource: "click", ofType: "wav")!
        let item = AVPlayerItem(asset: AVAsset(url: URL(fileURLWithPath: path)))
        player = AVPlayer(playerItem: item)
        player.play()
    }
}

let vc = UIViewController()
vc.view.backgroundColor = .white
let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 80))
label.text = "Hello"
vc.view.addSubview(label)
PlaygroundPage.current.liveView = vc

//DispatchQueue.async() {
//    Sound.play()
//    print("immediate")
//}

//DispatchQueue.async(after: 3.0) {
//    Sound.play()
//    print("not immediate")
//    DispatchQueue.asyncMain() {
//        label.text = "Done!"
//    }
//}

for index in 1 ... 10 {
    DispatchQueue.async(after: 2.0) {
        print("Setting to \(index)")
        DispatchQueue.asyncMain() {
            label.text = "\(index) wins"
        }
    }
}
