import Foundation

func inptStrings() -> [String] {
    var strings : [String] = []
    while let x = readLine() {
        strings.append(x)
    }
    return strings
}

//from apple forums
func flatten(_ array: [Any]) -> [Any] {
    var result = [Any]()
    for element in array {
        if let element = element as? [Any] {
            result.append(contentsOf: flatten(element))
        } else {
            result.append(element)
        }
    }
    return result
}

func charToInt(char:Character) -> Int?{
    switch char{
    case "a":
        return 0
    case "b":
        return 1
    case "c":
        return 2
    case "d":
        return 3
    case "e":
        return 4
    case "f":
        return 5
    case "g":
        return 6
    case "h":
        return 7
    case "i":
        return 8
    case "j":
        return 9
    case "k":
        return 10
    case "l":
        return 11
    case "m":
        return 12
    case "n":
        return 13
    case "o":
        return 14
    case "p":
        return 15
    case "q":
        return 16
    case "r":
        return 17
    case "s":
        return 18
    case "t":
        return 19
    case "u":
        return 20
    case "v":
        return 21
    case "w":
        return 22
    case "x":
        return 23
    case "y":
        return 24
    case "z":
        return 25
    default:
        return -1
    }
}

func getInput() -> [String] {
    var inputString : [String] = []
    repeat {
        let inputWord = readLine() 
        if inputWord != "" {
            inputString.append(inputWord!)
        } else {
            print("no string given")
            print("executing sort")
            break
        }
    } while true
    return inputString
}

func priorChar(charA:Character, charB:Character)->Character{
    if charToInt(char:charA)! <= charToInt(char:charB)! {
        return charA
    } else {
        return charB
    }
}

func postChar(charA:Character, charB:Character)->Character{
    if charToInt(char:charA)! <= charToInt(char:charB)! {
        return charB
    } else {
        return charA
    }
}

func returnChar(string:String, offsetBy:Int) -> Character? {
    if string.count > offsetBy { //+1
        let index = string.index(string.startIndex, offsetBy:offsetBy)
        return string[index]   
    }
    return Character(" ")
}

func getLetters(string:String) -> String{
    var output : String = ""
    let stringTest = string.lowercased()
    for char in stringTest {
        if charToInt(char:char)! >= 0 {
            output += String(char)
        }
    }
    return output
}

func greaterInt(IntA: Int, IntB: Int)->Int{
    if IntA > IntB {
        return IntA
    } else if IntB > IntA {
        return IntB
    } else {
        return IntA
    }
}

func lesserInt(IntA: Int, IntB: Int)->Int{
    if IntA < IntB {
        return IntA
    } else if IntB < IntA {
        return IntB
    } else {
        return IntA
    }
}

func compareWords(wordA: String, wordB:String, offset:Int) -> String { 
    if wordA < wordB {
        return wordA
    } else {
        return wordB
    }
}

func sortStrings(strings:[String], charCount:Int) -> [Any] {
    var Strings: [[Any]] = []
     for word in strings {
         var added = false
        for (count, array) in Strings.enumerated() {
            //compare array's first word's first letter with word's first letter
            if returnChar(string:getLetters(string:array[0] as! String), offsetBy:charCount) == returnChar(string:getLetters(string:word), offsetBy:charCount) {
                if charCount <= word.count {
                    Strings[count].append(word)
                    added = true
                }
                break
            }
        }
        
        //if no array with first letter of word was found, make new array with word
        if !added {
            var position = 0
            for array in Strings {
                if compareWords(wordA: word,wordB: array[0] as! String,offset: charCount) == word{
                    break
                } else {
                    position += 1
                }
            }
            Strings.insert([word],at:position)    
        }
     }
     
     for (count,array) in Strings.enumerated() {
         if array.count > 1 {
             Strings[count] = (sortStrings(strings: array as! [String], charCount:charCount + 1))
         }
     }
     return Strings 
}


func findWord(array:[String], word: String) -> Bool{
    for (count, word) in array.enumerated() {
        for (testCount, testWord) in array.enumerated() {
            if testWord == word && count != testCount {
                return true
            } else {
                return false
            }
        }
    }
    return false
}

func removeDuplicates(strings:[String]) -> [String] {
    var buffer : [String] = []
    for word in strings {
        for testWord in buffer {
            if word != testWord {
                buffer.append(word)
            }
        }
    }
    return buffer
}

func printElements(array:[Any]) {
    for element in array {
          print(element)
    }
}

print(flatten(sortStrings(strings: inptStrings(), charCount:0)))
