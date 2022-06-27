//: [Previous](@previous)

/*:
 ## What is a Concurrent Queue?
 A concurrent queue helps us execute multiple tasks at the same time, but there’s a limit to the number of tasks depending on the system. If used incautiously, it can cause Thread explosion and Deadlock.
 
*/
import Foundation

func example1() {
    let queue = DispatchQueue(label: "com.example.dispatch.concurrent", attributes: .concurrent)
    
    print("Random comment")
    
    queue.async() {
        print("Task 1 Pending")
        Thread.sleep(forTimeInterval: 3) // Wait for 3 seconds
        print("Task 1 Done")
    }
    
    print("Random comment1")

    queue.sync() {
        print("Task 2 Pending")
        Thread.sleep(forTimeInterval: 1) // Wait for 1 second.
        print("Task 2 Done")
    }
    
    print("Random comment2")
}

example1()

//: [Next](@next)
