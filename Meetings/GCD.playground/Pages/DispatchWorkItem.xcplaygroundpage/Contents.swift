//: [Previous](@previous)
/*:
 ## DispatchWorkItem
 
 ### What is DispatchWorkItem?

 DispatchWorkItem is used to store a task on a dispatch queue for later use, and you can perform operations several operations on it, you can even cancel the task if it is not required later in the code.
 
*/

import Foundation

func createDispatchWorkItem() {
    let queue = DispatchQueue(label: "com.example.dispatch.workItem") // serial queue
    
    // Create a work item
    let workItem = DispatchWorkItem() {
        print("Stored Task")
    }
    
    // Task 1
    queue.async(execute: workItem)
    
    // Task 2
    queue.asyncAfter(deadline: .now() + 1, execute: workItem)
    
    // Work Item cancel
    workItem.cancel()
    
    // Task 3
    queue.async(execute: workItem)
    
    if workItem.isCancelled {
        print("Task was canceled")
    }
}

createDispatchWorkItem()

//: [Next](@next)
