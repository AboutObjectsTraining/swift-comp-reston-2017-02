import Cocoa

// function declaration syntax
func display(degrees: Double, scale: String)
{
    print("The temperature is \(degrees)° \(scale)")
}

// function call syntax
display(degrees: 71.5, scale: "Fahrenheit")
// prints "The temperature is 71.5° Fahrenheit"

// temperatureInDegrees is external name of first param
func display(temperatureInDegrees degrees: Double, scale: String)
{
    // internal name is degrees
    print("The temperature is \(degrees)° \(scale)")
}


// external name required in call
display(temperatureInDegrees: 71.5, scale: "Fahrenheit")

// external names can be ignored by using _ wildcard
func display(_ degrees: Double, scale: String)
{
    print("The temperature is \(degrees)° \(scale)")
}

// calls must omit external name
display(71.5, scale: "Fahrenheit")

//// returns a value of type String
//func temperature(degrees: Double, scale: String) -> String
//{
//    return "The temperature is \(degrees)° \(scale)"
//}
//
//let s = temperature(degrees: 71.5, scale: "Fahrenheit")
//
//func doStuff() {
//    // compiles with warning ("Result of call '...' is unused")
//    temperature(degrees: 71.5, scale: "Fahrenheit")
//    
//    // compiles cleanly
//    let s = temperature(degrees: 71.5, scale: "Fahrenheit")
//    print(s)
//}

// return value can be ignored
@discardableResult
func temperature(degrees: Double, scale: String) -> String
{
    let s = "The temperature is \(degrees)° \(scale)"
    print(s)
    return s
}


