//
//  VectorTests.swift
//  Swift47Deg
//
//  Created by Javier de Silóniz Sandino on 23/4/15.
//  Copyright (c) 2015 47 Degrees. All rights reserved.
//

import UIKit
import XCTest

class VectorTests: XCTestCase {

    var vectorLevelZero : Vector<Int> = Vector()
    var vectorLevelOneMin : Vector<Int> = Vector()
    var vectorLevelOneMax : Vector<Int> = Vector()
    var vectorLevelTwoMin : Vector<Int> = Vector()
    var vectorLevelTwoMax : Vector<Int> = Vector()
    var vectorLevelThreeMin : Vector<Int> = Vector()
    var vectorLevelThreeMax : Vector<Int> = Vector()
    var vectorLevelFourMin : Vector<Int> = Vector()
    var vectorLevelFourMax : Vector<Int> = Vector()
    var vectorLevelFiveMin : Vector<Int> = Vector()
    var vectorLevelFiveMax : Vector<Int> = Vector()
    var vectorLevelSixMin : Vector<Int> = Vector()
    var vectorLevelSixMax : Vector<Int> = Vector()
    
    override func setUp() {
        super.setUp()
    
        for i in 0..<32 {
            vectorLevelZero = vectorLevelZero.append(i)
        }
        
        for i in 0...32 {
            vectorLevelOneMin = vectorLevelOneMin.append(i)
        }
        
        for i in 0..<64 {
            vectorLevelOneMax = vectorLevelOneMax.append(i)
        }
        
        for i in 0...64 {
            vectorLevelTwoMin = vectorLevelTwoMin.append(i)
        }
        
        for i in 0..<(1024 + 32) {
            vectorLevelTwoMax = vectorLevelTwoMax.append(i)
        }
        
        for i in 0...(1024 + 32) {
            vectorLevelThreeMin = vectorLevelThreeMin.append(i)
        }
        
        for i in 0..<(32768 + 32) {
            vectorLevelThreeMax = vectorLevelThreeMax.append(i)
        }
        
        for i in 0...(32768 + 32) {
            vectorLevelFourMin = vectorLevelFourMin.append(i)
        }
        
        for i in 0..<(1048576 + 32) {
            vectorLevelFourMax = vectorLevelFourMax.append(i)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLevels() {
        XCTAssertTrue(vectorLevelZero.debugTrieLevel == .Zero, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelOneMin.debugTrieLevel == .One, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelOneMax.debugTrieLevel == .One, "Vectors should handle its trie levels OK")
        
        var vectorLevelOneToZero = vectorLevelOneMin.pop()
        var vectorLevelOneToTwo = vectorLevelOneMax.append(666)
        XCTAssertTrue(vectorLevelOneToZero.debugTrieLevel == .Zero, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelOneToTwo.debugTrieLevel == .Two, "Vectors should handle its trie levels OK")
        
        XCTAssertTrue(vectorLevelTwoMin.debugTrieLevel == .Two, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelTwoMax.debugTrieLevel == .Two, "Vectors should handle its trie levels OK")
        
        var vectorLevelTwoToOne = vectorLevelTwoMin.pop()
        var vectorLevelTwoToThree = vectorLevelTwoMax.append(666)
        XCTAssertTrue(vectorLevelTwoToOne.debugTrieLevel == .One, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelTwoToThree.debugTrieLevel == .Three, "Vectors should handle its trie levels OK")
        
        XCTAssertTrue(vectorLevelThreeMin.debugTrieLevel == .Three, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelThreeMax.debugTrieLevel == .Three, "Vectors should handle its trie levels OK")
        
        var vectorLevelThreeToTwo = vectorLevelThreeMin.pop()
        var vectorLevelThreeToFour = vectorLevelThreeMax.append(666)
        XCTAssertTrue(vectorLevelThreeToTwo.debugTrieLevel == .Two, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelThreeToFour.debugTrieLevel == .Four, "Vectors should handle its trie levels OK")
        
        XCTAssertTrue(vectorLevelFourMin.debugTrieLevel == .Four, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelFourMax.debugTrieLevel == .Four, "Vectors should handle its trie levels OK")
        
        var vectorLevelFourToThree = vectorLevelFourMin.pop()
        var vectorLevelFourToFive = vectorLevelFourMax.append(666)
        XCTAssertTrue(vectorLevelFourToThree.debugTrieLevel == .Three, "Vectors should handle its trie levels OK")
        XCTAssertTrue(vectorLevelFourToFive.debugTrieLevel == .Five, "Vectors should handle its trie levels OK")
        
        println("lel")
    }
}
