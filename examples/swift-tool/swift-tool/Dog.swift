import Foundation

struct Dog
{
    var name: String
    var toys: [String]
    let barkText: String = "Woof, woof!"
    
    var favoriteToy: String {
        get { return toys.isEmpty ? "N/A" : toys[0] }
    }
    
    var toyNames: String {
        get { return toys.joined(separator: ", ") }
        set { toys = newValue.components(separatedBy: ", ") }
    }
    
    func bark() {
        print(barkText)
    }
    
    // suffix and numberOfTimes have external names, prefix does not
    func barkWithPrefix(_ prefix: String, suffix: String, numberOfTimes: Int)
    {
        for _ in 1...numberOfTimes {
            print("\(prefix), \(barkText) \(suffix)")
        }
    }
    
    // all three params have external names
    func bark(prefix: String, suffix: String, numberOfTimes: Int)
    {
        for _ in 1...numberOfTimes {
            print("\(prefix), \(barkText) \(suffix)")
        }
    }
    
    // external name for numberOfTimes is repetitions
    func woof(prefix: String, suffix: String, repetitions numberOfTimes: Int)
    {
        for _ in 1...numberOfTimes {
            print("\(prefix), \(barkText) \(suffix)")
        }
    }
}

extension Dog: CustomDebugStringConvertible
{
    // var toys: [String] { return ["Ball", "Rope", "Frisbee"] }
    
    var debugDescription: String { return "name: \(name), toys: \(toys)" }
    
    func howl() {
        print("Awooooooh!")
    }
}
