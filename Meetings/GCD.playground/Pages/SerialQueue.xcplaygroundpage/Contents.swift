//: [Previous](@previous)

/*:
 ## Private Queues
 
 Private queues are by default serial.
 
 There are only two ways, in which you can submit your task either in the Serial queue or in the Concurrent queue. In the serial queue, there is only one thread present. So the task will execute in one thread and wait for it to complete, then the other will execute. But in the concurrent queue, there are multiple threads present, which helps to execute more than one task at the same time, but as per the complexity of the task, execution completes, if a task is less complex then it will complete earlier than the comparatively complex task.
 
 ### What is a serial queue?
 A serial Dispatch Queue performs only one task at the time, no matter the way of execution, i.e. Synchronous or Asynchronous. Serial queues are often used to synchronize access to a specific value or resource to prevent data races to occur.
 
 All the queues need to wait for the completion of the previous queue. By default, DispatchQueue is a serial queue.

 
 ![Serial Queue](serial-queue.png)
 
 
 Example:
*/

import Foundation

func serialExecutionWithAsync() {
    let serialQueue2 = DispatchQueue(label: "example.serial.queue2")

    serialQueue2.async() {
        print("Task 1 Started")
        Thread.sleep(forTimeInterval: 3) // Wait for 3 seconds
        print("Task 1 Done")
    }
    
    print("Random comment")
    
    serialQueue2.async() {
        print("Task 2 Started")
        Thread.sleep(forTimeInterval: 1) // Wait for 1 second.
        print("Task 2 Done")
    }
    
    print("Random comment2")

}

//serialExecutionWithAsync()

func serialExecutionWithSync() {
    let serialQueue2 = DispatchQueue(label: "example.serial.queue2")

    print("Random comment")

    serialQueue2.sync() {
        print("Task 1 Started")
        Thread.sleep(forTimeInterval: 3) // Wait for 3 seconds
        print("Task 1 Done")
    }
    
    print("Random comment2")

    serialQueue2.async() {
        print("Task 2 Started")
        Thread.sleep(forTimeInterval: 1) // Wait for 1 second.
        print("Task 2 Done")
    }
    
    print("Random comment3")
}

serialExecutionWithSync()

/*:
 As you can see in the Output, the code is executed in the order it was defined, even though we used the async( ) function, the first thread took 3 seconds for completion and after that, the second thread was executed which took another second to complete.

 In short, the code executed by Serial DispatchQueue is not parallel and has to wait for the first task to complete. This way of execution is also known as First In, First Out (FIFO).
*/



//: [Next](@next)
