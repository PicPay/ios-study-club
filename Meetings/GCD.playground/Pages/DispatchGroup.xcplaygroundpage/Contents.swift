//: [Previous](@previous)

/*:

 ## DispatchGroup
 ### What is DispatchGroup?
 If you have heard about DispatchGroup, one of the questions that arrive in our mind is that, is it some form of DispatchQueue?

 No, DispatchGroup is a **subclass** of *DispatchObject*, and it helps us group multiple queues regardless of their type (Concurrent or Serial). Next, We can set a completion callback to execute on any Thread (Main or Background) specified by us.
 
 **Principal Methods**
 - enter(): Used to indicate that a block of code has entered into the group
 - leave(): Used to indicate that a block of code has finished execution and left the group
 - wait(): Wait synchronously for the submitted work to finish. Blocks the calling thread until the work is finished.
 - notify(): Notifies the required thread that the submitted block has finished execution
*/


import Foundation

func dispatchGroupExample(thread: DispatchQueue = .main) {
    // Create Group
    let group = DispatchGroup()

    // Date created for demo purposes
    let date = Date()

    // Create a Concurrent Queue
    let queue = DispatchQueue(label: "com.example.dispatch.concurrent.queue", attributes: .concurrent)

    // Link the Queue to Group
    // will run on multiple threads
    queue.async(group: group) {  // Group Linked
        print("Task 1 started")
        Thread.sleep(forTimeInterval: 3)    // Wait for 3 seconds
        let difference = Date().timeIntervalSince(date)
        print("Task 1 Done with difference of \(difference.rounded()) seconds")
    }

    // Create a Serial queue
    let queue2 = DispatchQueue(label: "com.example.dispatch.serial.queue")

    // Link the Queue to Group
    // will run only on 1 thread
    queue2.async(group: group) {  // Group Linked
        print("Task 2 started")
        Thread.sleep(forTimeInterval: 1)    // Wait for 1 second
        let difference = Date().timeIntervalSince(date)
        print("Task 2 Done with difference of \(difference.rounded()) seconds")
    }

    // Notify Completion of tasks on main thread.
    group.notify(queue: DispatchQueue.main) {
        print("All tasks started")
        // Update UI
        Thread.sleep(forTimeInterval: 1)    // Wait for 1 second
        let difference = Date().timeIntervalSince(date)
        print("All tasks executed with difference of \(difference.rounded()) seconds")
    }

    /* Output:
      Task 2 Done with difference of 1.0 seconds
      Task 1 Done with difference of 3.0 seconds
      All tasks executed with difference of 4.0 seconds
    */
}

dispatchGroupExample()

/*: Real world example
 
 ```swift
     group.enter()
     userService.fetchProfile { profile in
       movieIds.insert(profile.allTimeFavorite)
       group.leave()
     }

     group.enter()
     userService.fetchFavorites { favorites in
       for favorite in favorites {
         movieIds.insert(favorite.movie)
       }
       group.leave()
     }

     group.enter()
     userService.fetchTickets { tickets in
       for ticket in tickets {
         movieIds.insert(ticket.movie)
       }
       group.leave()
     }
 ```
 
 //  ChatSetupServicing
// The Dispatch Group will keep track of all calls to enter() and leave()
*/

//: [Next](@next)
