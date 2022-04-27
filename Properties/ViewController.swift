//
//  ViewController.swift
//  Properties
//
//  Created by arshad on 4/27/22.
//



/*
 
 Properties:
 Properties are Associate Values for class,struct,enums
 Stored and computed properties are usually associated with instances of a particular type.
 Stored properties are provided only by classes and structures.
 A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used.
 
 
 Type of Properties:
     stored properties:  only use for class and struct
      assign the values when ever create instance of class or Struct as default values.
     example:
                 struct FixedLengthRange {
                     var firstValue: Int
                     let length: Int
                 }
                 var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
                 
 Compound properties: use for class, struct, enums
         instedad of assign a values to properties we used to write code for get and set.
             set is used for assign new values for properties
             get is return the value from properties
 
        Examples:
             struct CompactRect {
                 var origin = Point()
                 var size = Size()
                 var center: Point {
                     get {
                         Point(x: origin.x + (size.width / 2),
                               y: origin.y + (size.height / 2))
                     }
                     set {
                         origin.x = newValue.x - (size.width / 2)
                         origin.y = newValue.y - (size.height / 2)
                     }
                 }
             }
     
     Read only Compute Property:  only use in ther get (Return the code)
 
             struct Cuboid {
                 var width = 0.0, height = 0.0, depth = 0.0
                 var volume: Double {
                     return width * height * depth
                 }
             }
                 
 
 Property Observers:
          Property observers observe and respond to changes in a property’s value
          --> didset, willset
            willSet is called just before the value is stored.
            didSet is called immediately after the new value is stored.
 
    
     examples:
 
             
             class StepCounter {
                 var totalSteps: Int = 0 {
                     willSet(newTotalSteps) {
                         print("About to set totalSteps to \(newTotalSteps)")
                     }
                     didSet {
                         if totalSteps > oldValue  {
                             print("Added \(totalSteps - oldValue) steps")
                         }
                     }
                 }
             }
             let stepCounter = StepCounter()
             stepCounter.totalSteps = 200
             // About to set totalSteps to 200
             // Added 200 steps
             stepCounter.totalSteps = 360
             // About to set totalSteps to 360
             // Added 160 steps
             stepCounter.totalSteps = 896
             // About to set totalSteps to 896
             // Added 536 steps
*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.storedProperty()
        self.computeValues()
       
        
        
        let content = Content(name: "swiftlee-banner", fileExtension: "png")
        print(content.filename)
        
        
        let data = findAge(peopleData: [ people(name: "khana", age: 20),
                                         people(name: "rama", age: 120),
                                         people(name: "asdsa", age: 70),
                                         people(name: "kha", age: 90),
                                         people(name: "aas", age: 340)
                                       
                        
                                       ])
        
       print( data.findAge)
        
    }
    
    func storedProperty(){
        ///stored property
        let property1 = storeProperty1(name: "names", age: 10)
        print(property1.age)
        print(property1.name)
    }
    
    
    func computeValues(){
        let compute = computePropty()
        print(compute.data)
        
    }
}


//stored Property

class storeProperty1 {
    var name:String?
    var age:Int?

    init(name:String?,age:Int?){
        self.name = name
        self.age = age
    }
}

//compute property
//get and set

class computePropty {
    var name:String{
          return "Hello world"
    }
    var age:Int{
        get{
            return 120
        }
    }
    
    var data:Any{
        return "\(name) haha \(age)"
    }
}

// A computed property to generate a filename.
struct Content {
    var name: String
    let fileExtension: String
    var filename: String {
        return name + "." + fileExtension
    }
}



struct people {
    let name:String
    let age:Int
}


struct findAge{
    let peopleData:[people]
    var findAge:people{
        peopleData.sorted { (lhs, rhs) -> Bool in
            return lhs.age < rhs.age
        }[0]
    }
}
