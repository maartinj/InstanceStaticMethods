import UIKit
/*:
 ## Instance and static class and struct methods
 What is the difference and how can I use them to modify properties?
 
 ### How I use to do things :(
 */
class Score {
    var current: Int = 0
}

func increment(_ score: Int, val: Int = 1) -> Int {
    score + val
}

var myScore = Score()
myScore.current
myScore.current = increment(myScore.current)
myScore.current
myScore.current = increment(myScore.current, val: 5)
myScore.current
/*:
 ### A better way is to bring the method into the class as an instance method
 */
class Score1 {
    var current: Int = 0
    
    func increment(_ val: Int = 1) {
        current += val
    }
}

var myScore1 = Score1()
myScore1.increment()
myScore1.current
myScore1.increment(5)
myScore1.current
/*:
 ## What about structs?
 An instance method in a struct cannot modify a stored property unless the function is marked as mutating
 */
struct Score2 {
    var current: Int = 0
    
    mutating func increment(_ val: Int = 1) {
        current += val
    }
}

var myScore2 = Score2()
myScore2.increment()
myScore2.current
myScore2.increment(5)
myScore2.current

myScore2.current = 10
myScore2.current
/*:
## Restricting Access
 ### private(set)
Prevent the modificatioin of a stored property from outside of the class or struct
*/
struct Score3 {
    private(set) var current: Int = 0
    
    mutating func increment(_ val: Int = 1) {
        current += val
    }
}

var myScore3 = Score3()
myScore3.increment()
myScore3.increment(5)
myScore3.current
/*:
 ## Static Properties and Methods
 Ability to update a property that applies to all instances
 */
struct Score4 {
    private(set) var current: Int = 0
    static var highestScore: Int = 0
    
    mutating func increment(_ val: Int = 1) {
        current += val
        if current > Score4.highestScore {
            Score4.highestScore = current
        }
    }
}

var score1 = Score4()
var score2 = Score4()

score1.increment(10)
Score4.highestScore

score2.increment(6)
Score4.highestScore
score2.increment(6)
Score4.highestScore
