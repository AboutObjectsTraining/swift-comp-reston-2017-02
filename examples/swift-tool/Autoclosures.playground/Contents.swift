import UIKit


extension String
{
    func sum() -> Int?
    {
        let characterViews = characters.split { $0 == "," }
        let groupVals = characterViews.map { Int(String($0)) ?? 0 }
        let reversedVals = groupVals.reversed() as Array
        let enumeratedVals = reversedVals.enumerated()
        
        return enumeratedVals.reduce(0) {
            (sum: Int, curr: (index: Int, value: Int)) in
            let power = pow(10.0, Double(curr.index * 3))
            return sum + (curr.value * Int(power))
        }
    }
    
    func sum2() -> Int?
    {
        let reversedVals = characters
            .split { $0 == "," }
            .map { Int(String($0)) ?? 0 }
            .reversed() as Array
        
        return reversedVals.enumerated().reduce(0) {
            (sum: Int, curr: (index: Int, value: Int)) in
            let power = pow(10.0, Double(curr.index * 3))
            return sum + (curr.value * Int(power))
        }
    }

    func sum3() -> Int?
    {
        let characterViews = self.characters.split { $0 == "," }
        let groupVals = characterViews.map { Int(String($0)) ?? 0 }
        let reversedVals = groupVals.reversed() as Array
        
        var sum = 0
        
        for index in 0...reversedVals.count {
            let power = pow(10.0, Double(index * 3))
            sum += (Int(reversedVals[index]) * Int(power))
        }
        
        return sum
    }

    
    
    func printSelf() {
        print(Unmanaged.passUnretained(self as AnyObject).toOpaque())
    }
}

func sum(groupedDigits: String) -> Int
{
    let groups = Array((groupedDigits.characters.split { $0 == "," }.map { String($0) }).reversed())
    var sum = 0
    for i in 0..<groups.count {
        if let intVal = Int(groups[i]) {
            let power = pow(10.0, Double(i * 3))
            sum += (intVal * Int(power))
        }
    }
    return sum
}

let digits = "1,234,567"

let sum1 = sum(groupedDigits: digits)
print("Int value is \(sum1)")

let sum2 = digits.sum2()
print("Int value is \(sum2)")


digits.printSelf()


let characterViews = digits.characters.split { $0 == "," }
print(characterViews)

let groupedDigits = characterViews.map { String($0) }
print(groupedDigits)

let groupedInts = groupedDigits.map { return Int($0) ?? 0 }
print(groupedInts)

let reversedGroups = groupedInts.reversed() as Array
print(reversedGroups)

let enumeratedGroups = reversedGroups.enumerated()
print(enumeratedGroups)

for val in enumeratedGroups {
    print(val)
}
