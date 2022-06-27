//: [Previous](@previous)
import Foundation
import UIKit
/*:
 
 
 Every app comes with a Main queue, which is a serial queue that executes tasks on the main thread. This queue is responsible for drawing your application’s UI and responding to user interactions (touch, scroll, pan, etc.) If you block this queue for too long, your iOS app will appear to freeze.
 
 When performing a long-running task (network call, computationally intensive work, etc), we avoid freezing the UI by performing this work on a background queue, then we update the UI with the results on the main queue
 
 Example:
 
 ```swift
 // URLSession automatically bring the code to the background thread, that's why you need to explicitily go back to main thread when doing networking calls with URLSession
 
 URLSession.shared.dataTask(with: url) { data, response, error in
     if let data = data {
         DispatchQueue.main.async { // UI work
             self.label.text = String(data: data, encoding: .utf8)
         }
     }
 }
 ```
*/


//: [Next](@next)
