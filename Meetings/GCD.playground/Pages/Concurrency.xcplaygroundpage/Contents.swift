/*:

 ## Concurrency
 Concurrency is the `greatest` tool of swift!
 
 Concurrency lets you take advantage of the fact that your device has multiple CPU cores. To make use of these cores, you will need to use multiple threads. However, threads are a low-level tool, and managing threads manually in an efficient manner is extremely difficult.
 
 Concurrent and Serial queues help us to manage how we execute tasks and help to make our applications run faster, more efficiently, and with improved responsiveness. We can create queues easily using the DispatchQueue class which is built on top of the Grand Central Dispatch (GCD) queue.

 The benefit of dispatch queues is that they’re a lot simpler to understand and more efficient at executing tasks on different threads compared to the lower level GCD threading code. Still, there’s a lot to learn, so let’s dive into the differences between concurrent and serial queues.


 
 ### What is a dispatch queue?
 A ``DispatchQueue`` is an abstraction layer on top of the GCD queue that allows you to perform tasks asynchronously and concurrently in your application. Tasks are always executed in the order they’re added to the queue.
 
Apple have provided us three kinds of queueus available to you:
 - The Main dispatch queue (serial, pre-defined)
 - Global queues (concurrent, pre-defined)
 - Private queues (can be serial or concurrent, you create them)
 
 
 We gonna to start talking about the generally used pre-defined queue: The Main Queue
*/




/*:
 
 This causes a delay because it's trying to convert the photoURL on data on the main thread(default thread).
 ```
 if let urlPhoto = URL(string: contact.photoURL) {
     do {
         let data = try Data(contentsOf: urlPhoto)
         let image = UIImage(data: data)
         cell.contactImage.image = image
     } catch _ {}
 }
 ```
 
 Solution:
 
 ``` swift
 DispatchQueue.global().async {
     if let urlPhoto = URL(string: contact.photoURL) {
         do {
             let data = try Data(contentsOf: urlPhoto)
             let image = UIImage(data: data)
             DispatchQueue.main.async {
                 cell.contactImage.image = image
             }
         } catch _ {}
     }
 }
 ```
*/

import Foundation



/*:
 
 Resources:
 
 - [Concurrent vs Serial DispatchQueue](https://www.avanderlee.com/swift/concurrent-serial-dispatchqueue/)
 - [Race condition vs. Data Race](https://www.avanderlee.com/swift/race-condition-vs-data-race/)
 - [Thread Sanitizer explained: Data Races in Swift](https://www.avanderlee.com/swift/thread-sanitizer-data-races/)
 - [Concurrency and Application Design](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/ConcurrencyandApplicationDesign/ConcurrencyandApplicationDesign.html#//apple_ref/doc/uid/TP40008091-CH100-SW8)
 - [How to use GCD (Grand Central Dispatch) in Swift? - Synchronous & Asynchronous Programming Tutorial](https://www.swiftpal.io/articles/how-to-use-gcd-grand-central-dispatch-tutorial)
 - [Concurrency, Sync, Async, Serial, Concurrent](https://medium.com/nerd-for-tech/concurrency-sync-async-serial-concurrent-76c1ebc75577)
 - [Sequencing Tasks with DispatchGroup](https://www.donnywals.com/sequencing-tasks-with-dispatchgroup/)
 - [Understanding how DispatchQueue.sync can cause deadlocks](https://www.donnywals.com/understanding-how-dispatchqueue-sync-can-cause-deadlocks/)
 - [Dispatching async or sync? The differences explained](https://www.donnywals.com/dispatching-async-or-sync-the-differences-explained/)
 - [Thread Sanitizer explained: Data Races in Swift](https://www.avanderlee.com/swift/thread-sanitizer-data-races/)
 - [URLSession Pitfalls](https://www.avanderlee.com/swift/urlsession-common-pitfalls-with-background-download-upload-tasks/)
*/

//: [Next](@next)


