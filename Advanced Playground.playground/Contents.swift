//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func assertTrue(@autoclosure term : () -> Bool) -> Bool {
    return term() == true
}

func assertTrue2(term : () -> Bool) -> Bool {
    return term() == true
}
print(assertTrue(2 == 1))
print(assertTrue2({2 == 1}))

//Classes vs Structures
//Value typed video https://developer.apple.com/videos/play/wwdc2015/414/

class A {
    
    lazy var myStr : String = { return "Abc" }()
    
    var backedString : String = "Abc"
    
    var myInt : Int {
        get {
            return backedString.characters.count
        }
        
        set(newMyInt) {
            print(newMyInt)
        }
    }
    
    var observedInt : Int = 1 {
        willSet {
            print("will set \(observedInt) to \(newValue)")
        }
        
        didSet {
            print("did set \(observedInt) from \(oldValue)")
        }
    }
    
    
}



var a = A()
print(a.myInt)
a.myInt = 1
a.backedString = "Ab"
print(a.myInt)

a.observedInt = 2

extension Int {
    func times(f : () -> Void) {
        for _ in 0..<self {
            f()
        }
    }
}

protocol PrettyPrint {
    func pretty() -> String
}

extension String : PrettyPrint {
    func pretty() -> String {
        return "pretty \(self)"
    }
}

extension PrettyPrint {
    func pretty() -> String {
        return "default pretty \(self)"
    }
}

extension Int : PrettyPrint {}

print(1.pretty())


1.times {
    print("ahoj")
}

print("MyString".pretty())

//Protocol oriented https://developer.apple.com/videos/play/wwdc2015/408/
//


