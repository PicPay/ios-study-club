//: [Previous](@previous)
import Foundation

/*:
 ## Sync vs Async
 
 When we invoke some tasks synchronously, it means that the thread that initiated that operation will wait for the task to finish before continuing another task, but when we put tasks asynchronously it means that the thread will not wait for that tasks to complete, instead, it starts executing other tasks that assigned to it simultaneously.
 
 
 Regardless of whether you dispatch synchronously or asynchronously, and whether you choose a serial or concurrent queue, all of the code inside a single task will execute line by line. Concurrency is only relevant when evaluating multiple tasks.
 For example, if you have 3 loops inside the same task, these loops will always execute in order:
*/

func firstExample() {
    DispatchQueue.global().async {
        for i in 0..<3 {
            print(i)
        }

        for _ in 0..<3 {
            print("🔵")
        }

        for _ in 0..<3 {
            print("💔")
        }
    }
}


//firstExample()

/*:

 ### What is the current queue?
 It may not be obvious what the source, or current, queue is, because it’s not always explicitly defined in the code. For example, if you call your sync statement inside viewDidLoad, your current queue will be the Main dispatch queue. If you call the same function inside a URLSession completion handler, your current queue will be a background queue.
 
 
 URLSession change the current queue to a *background* thread(such as global). The default thread of our code is the *main* thread
*/



/*:
### Synchronous Programming
 When your code reaches a sync statement, it will block the current queue until that task completes. Once the task returns/completes, control is returned to the caller, and the code that follows the sync task will continue.
 Think of sync as synonymous with ‘blocking’.
 
*/

func example2() {
    DispatchQueue.global().sync {
        print("Sync - Inside")
    }
    print("Sync - Outside")
}

//example2()

/*:
 Preferly doing it synchronously; it has a lot of situations that you could use queue.sync, making your cores work for you is beneficial for your application.
 
 Synchronous programming is widely used when you need to execute a task in the order you have written, maintaining the performance of the application.
*/

func example3() {
    let queueSync = DispatchQueue(label: "com.example.dispatch.synchronous")

    // Task
    queueSync.sync {
        Thread.sleep(forTimeInterval: 2) // Wait for 2 seconds
        print("Task 1 Done")
    }
    
    print("Task 2 Done")
}

//example3()

/*:
 An async statement, on the other hand, will execute asynchronously with respect to the current queue, and immediately returns control back to the caller without waiting for the contents of the async closure to execute. There is no guarantee as to when exactly the code inside that async closure will execute.
*/

func example4() {
    DispatchQueue.global().async {
        print("Async - Inside")
    }
    print("Async - Outside")
}

//example4()

func example5() {
    let queueAsync = DispatchQueue(label: "com.example.dispatch.asynchronous")
    
    queueAsync.async {
        Thread.sleep(forTimeInterval: 2) // Wait for 2 seconds.
        print("Task 1 Done")
    }
    
    print("Task 2 Done")
}

example5()

//: [Next](@next)
