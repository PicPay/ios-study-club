//: [Previous](@previous)
import Foundation

/*:
# Quality of Service
 In addition to the main queue, every app comes with several pre-defined concurrent queues that have varying levels of Quality of Service (an abstract notion of priority in GCD.)
 
 For example, here’s the code to submit work asynchronously to the user interactive (highest priority) QoS queue:
*/

func interactiveQos() {
    let userInteractiveQoS: DispatchQoS.QoSClass = .userInteractive

    DispatchQueue.global(qos: userInteractiveQoS).async {
        print("We're on a global concurrent queue! with qos: \(userInteractiveQoS)")
    }

    /*:
     Alternatively, you can call the default priority global queue by not specifying a QoS like this:
    */


    DispatchQueue.global().async {
        print(userInteractiveQoS)
        print("Generic global queue")
    }
}

interactiveQos()

/*:
 ### QoS (Quality of Service)
 Defining quality of service helps us categorize the task of our DispatchQueue with priority. But this doesn’t mean that we should schedule all the tasks at a high priority. By using it the right way, we could make our app energy efficient and responsive.
*/

func createQoS() {
    let queue = DispatchQueue(label: "com.example.dispacth.qos")
    
    queue.async(qos: .background) {
        print("Background Code")
    }
    
    queue.async(qos: .userInitiated) {
        print("User initiated Code")
    }
}
createQoS()

let queue = DispatchQueue(label: "com.ui.loading", qos: .userInitiated)
/*:
 QoS can be used with .async() function, and the priorities are divided into four main categories.

 - userInteractive: Used for animations, or updating UI.

 - userInitiated: Used for tasks like loading data from API, preventing the user from making interactions.

 - utility: Used for tasks that do not need to be tracked by the user.

 - background: Used for tasks like saving data in the local database or any maintenance code which is not on high priority.
 
 Try to categorize your code while using DispatchQueue’s,  so that the apps you are developing become energy efficient and responsive.

 Once you categorize your task, the system handles it the best way possible constrained to the availability of resources. Another point to note is that **utility** and **background** have **low priority** over the others, and we should try to reason our code and use all of them according to our needs.

*/
    
//: [Next](@next)
