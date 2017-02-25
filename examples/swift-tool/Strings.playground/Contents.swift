import Foundation

let text = "Hello World!"

text.isEmpty         // prints false

text.lowercased()     // prints "hello world!"
text.uppercased()
text.hasPrefix("Hello")
text.hasSuffix("World")

let fruits = [ "Apple", "Pear", "Banana"]
let separator = ", "
let fruitString = fruits.joined(separator: separator)
print(fruitString) // prints "Apple, Pear, Banana"

let words = fruitString.characters.split { ", ".characters.contains($0) }.map { String($0) }

print(words) // prints "[Apple, Pear, Banana]"

func separator(character: Character) -> Bool {
    return ", ".characters.contains(character)
}

let elements = fruitString.characters.split(whereSeparator: separator)

let substrings = elements.map { String($0) }
print(elements[0])
print(substrings)

for currChar in text.characters {
    print(currChar)
}
// prints each character in the string, one per line

let firstChar  = text[text.startIndex]
let secondChar = text[text.index(after: text.startIndex)]
let thirdChar  = text[text.index(text.startIndex, offsetBy: 2)]

let startIndex = text.index(text.startIndex, offsetBy: 6)
text[startIndex] // returns "W"

let endIndex = text.index(text.endIndex, offsetBy: -1)
text[endIndex]  // returns "!"

let range1 = Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
text[range1] // returns "World"

let range2 = startIndex ..< endIndex
text[range2] // returns "World"

let range3 = startIndex ... endIndex
text[range3] // returns "World!"


// Global Functions

text.characters.count          //prints 12
let hasH = text.characters.contains("H")  // NOTE: second arg is character, not string
print(hasH)          // prints true
let hasVowels = text.characters.contains(where: { "aeiou".characters.contains($0) })
print (hasVowels)    // prints true
let location = text.characters.index(of: "W")  // NOTE: second arg is character, not string
print(location)      // prints "Optional(6)"

// Bridged to NSString

"hello world!".capitalized


// NSString

let foundationStr = "Hello World!" as NSString
foundationStr.length               // 12
foundationStr.substring(from: 6)   // "World!"
foundationStr.substring(to: 5)     // "Hello"

let range = foundationStr.range(of: "World") // (6, 5)
foundationStr.substring(with: range)         // "World"

let fruitText = "Apple, Pear, Banana" as NSString
let fruits2 = fruitText.components(separatedBy: ", ")

// Try to write string "Apple, Pear, Banana" to a file
//
let s1 = "Apple, Pear, Banana"
let fileName = "/tmp/fruit.txt"
let encoding = String.Encoding(rawValue: String.Encoding.utf8.rawValue)
do {
    try s1.write(toFile: fileName, atomically: true, encoding: encoding)
    let s2 = try String(contentsOfFile: fileName, encoding: encoding)
    print(s2)
}
catch _ { print("Unable to write to file \(fileName)") }

let clonedFruitText = try? NSString(contentsOfFile: fileName, encoding: String.Encoding.utf8.rawValue)
//
// "Apple, Pear, Banana"

// Foundation + Emoji = 🐛

let emojiText = "Hello World! 😊🌍"
emojiText.characters.count            // returns 15

let foundationEmojiText: NSString = emojiText as NSString
foundationEmojiText.length  // returns 17


// Formatting

let foo: NSString = "Foo"
let s3 = String(format: "foo's length is %d", foo.length)
// prints "foo's length is 3"

let fahrenheit = 78.5
let s4 = String(format: "temperature is %.1f°F", fahrenheit)
// prints "temperature is 78.5°F"


