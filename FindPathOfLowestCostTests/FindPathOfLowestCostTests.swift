//
//  FindPathOfLowestCostTests.swift
//  FindPathOfLowestCostTests
//
//  Created by neelam on 15/12/16.
//  Copyright © 2016 neelam. All rights reserved.
//

import XCTest

@testable import FindPathOfLowestCost
@testable import POLCSwiftLib

class FindPathOfLowestCostTests: XCTestCase {
    
    var polcViewController : POLCViewController!
    override func setUp() {
        super.setUp()
        
        polcViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "polcViewController") as! POLCViewController
        polcViewController.beginAppearanceTransition(true, animated: false)
        polcViewController.viewDidLoad()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        polcViewController.endAppearanceTransition()
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK:- Test Case for 5 x 6 Matrix - Linear Matrix - No wraps
    func testLowestCostPathInMatrix_5_6_EX() {
        
        // Hard code Example Matrix of 5 X 6
        
        /*
         [3, 4, 1, 2, 8, 6,
         6, 1, 8, 2, 7, 4,
         5, 9, 3, 9, 9, 5,
         8, 4, 1, 3, 2, 6,
         3, 7, 2, 8, 6, 4]
         */
        
        // Result would be "YES" means traversing would be completed , Least code of found path is '16' and Row numbers traversed is [1, 2, 3, 4, 4, 5]
        

        
        
        var matrix = Matrix(rows: 5, columns: 6)
        
        matrix[0,0] = 3
        matrix[0,1] = 4
        matrix[0,2] = 1
        matrix[0,3] = 2
        matrix[0,4] = 8
        matrix[0,5] = 6
        
        matrix[1,0] = 6
        matrix[1,1] = 1
        matrix[1,2] = 8
        matrix[1,3] = 2
        matrix[1,4] = 7
        matrix[1,5] = 4
        
        
        matrix[2,0] = 5
        matrix[2,1] = 9
        matrix[2,2] = 3
        matrix[2,3] = 9
        matrix[2,4] = 9
        matrix[2,5] = 5
        
        
        matrix[3,0] = 8
        matrix[3,1] = 4
        matrix[3,2] = 1
        matrix[3,3] = 3
        matrix[3,4] = 2
        matrix[3,5] = 6
        
        
        matrix[4,0] = 3
        matrix[4,1] = 7
        matrix[4,2] = 2
        matrix[4,3] = 8
        matrix[4,4] = 6
        matrix[4,5] = 4
        
        let algo = POLCAlgorithm()
        let result = algo.findPathOfLowestCostIn(matrix)
        
        // Test to match the result
        XCTAssertEqual("Yes", result.0)
        XCTAssertEqual(16, result.1)
        XCTAssertEqual([1, 2, 3, 4, 4, 5], result.2)
        
    }
    
    //MARK:- Test Case for 5 x 6 Matrix Wrapped concept
    func testLowestCostPathInMatrix_5_6_Wrap_Ex() {
        
        // Hard code Example Matrix of 5 X 6 but path wraps itsself to find the least cost
        
        /*
         [3, 4, 1, 2, 8, 6,
         6, 1, 8, 2, 7, 4,
         5, 9, 3, 9, 9, 5,
         8, 4, 1, 3, 2, 6,
         3, 7, 2, 1, 2, 3]
         */
        
        // Result would be "YES" means traversing would be completed , Least code of found path is '16' and Row numbers traversed is [1, 2, 1, 5, 4, 5]
        
       
        
        var matrix = Matrix(rows: 5, columns: 6)
        
        matrix[0,0] = 3
        matrix[0,1] = 4
        matrix[0,2] = 1
        matrix[0,3] = 2
        matrix[0,4] = 8
        matrix[0,5] = 6
        
        matrix[1,0] = 6
        matrix[1,1] = 1
        matrix[1,2] = 8
        matrix[1,3] = 2
        matrix[1,4] = 7
        matrix[1,5] = 4
        
        
        matrix[2,0] = 5
        matrix[2,1] = 9
        matrix[2,2] = 3
        matrix[2,3] = 9
        matrix[2,4] = 9
        matrix[2,5] = 5
        
        
        matrix[3,0] = 8
        matrix[3,1] = 4
        matrix[3,2] = 1
        matrix[3,3] = 3
        matrix[3,4] = 2
        matrix[3,5] = 6
        
        
        matrix[4,0] = 3
        matrix[4,1] = 7
        matrix[4,2] = 2
        matrix[4,3] = 1
        matrix[4,4] = 2
        matrix[4,5] = 3
        
        let algo = POLCAlgorithm()
        let result = algo.findPathOfLowestCostIn(matrix)
        
        XCTAssertEqual("Yes", result.0)
        XCTAssertEqual(11, result.1)
        XCTAssertEqual([1, 2, 1, 5, 4, 5], result.2)
        
    }
    
    //MARK:- Test Case for 1 x 5 Matrix 
    func testLowestCostPathInMatrix_1_5_Ex() {
        
        // Hard code Example Matrix of 1 X 5
        
        /*
         [3, 4, 1, 2, 8]
         */
        
        // Result would be "YES" means traversing would be completed , Least code of found path would be '18' and Row numbers traversed would be  [1, 1, 1, 1, 1]
        
        var matrix = Matrix(rows: 1, columns: 5)
        
        matrix[0,0] = 3
        matrix[0,1] = 4
        matrix[0,2] = 1
        matrix[0,3] = 2
        matrix[0,4] = 8
        
        let algo = POLCAlgorithm()
        let result = algo.findPathOfLowestCostIn(matrix)
        XCTAssertEqual("Yes", result.0)
        XCTAssertEqual(18, result.1)
        XCTAssertEqual([1, 1, 1, 1, 1], result.2)
        
    }
    
    //MARK:- Test Case for 5 x 1 Matrix
    func testLowestCostPathInMatrix_5_1_Ex() {
        
        // Hard code Example Matrix of 1 X 5
        
        /*
         [3,
         4,
         1,
         2,
         8]
         */
        
        // Result would be "YES" means traversing would be completed , Least code of found path would be '1' and Row numbers traversed would be  [3]
        
      
        
        var matrix = Matrix(rows: 5, columns: 1)
        
        matrix[0,0] = 3
        matrix[1,0] = 4
        matrix[2,0] = 1
        matrix[3,0] = 2
        matrix[4,0] = 8
        
        let algo = POLCAlgorithm()
        let result = algo.findPathOfLowestCostIn(matrix)
        XCTAssertEqual("Yes", result.0)
        XCTAssertEqual(1, result.1)
        XCTAssertEqual([3], result.2)
        
    }
    
    //MARK:- Test Case for No Path Found in Matrix
    func testLowestCostPathInMatrix_NO_Traverser_Ex() {
        
        // Hard code Example Matrix of 3 X 5 in which traversing is not completed
        
        /*
         [19, 10, 19, 10, 19,
         21, 23, 20, 19, 12,
         20, 12, 20, 11, 10]
         */
        
        // Result would be "No" means traversing would not completed , Least code of found path would be '48' and Row numbers traversed would be  [1,1,1]
        
        
        var matrix = Matrix(rows: 3, columns: 5)
        
        matrix[0,0] = 19
        matrix[0,1] = 10
        matrix[0,2] = 19
        matrix[0,3] = 10
        matrix[0,4] = 19
        
        matrix[1,0] = 21
        matrix[1,1] = 23
        matrix[1,2] = 20
        matrix[1,3] = 19
        matrix[1,4] = 12
        
        
        matrix[2,0] = 20
        matrix[2,1] = 12
        matrix[2,2] = 20
        matrix[2,3] = 11
        matrix[2,4] = 10
        
        let algo = POLCAlgorithm()
        let result = algo.findPathOfLowestCostIn(matrix)
        XCTAssertEqual("No", result.0)
        XCTAssertEqual(48, result.1)
        XCTAssertEqual([1, 1, 1], result.2)
        
    }
    
    //MARK:- Test Case for Matrix read from a String Input
    func testLowestCostPathInMatrixReadFromString() {
        
        let inputString = "3,4,1,2,8,6\n6,1,8,2,7,4\n5,9,3,9,9,5\n8,4,1,3,2,6\n3,7,2,1,2,3"
        let matrix = Matrix.init(input: inputString)
        
        XCTAssertNotNil(matrix)

        let algo = POLCAlgorithm()
        let result = algo.findPathOfLowestCostIn(matrix)
        
        XCTAssertEqual("Yes", result.0)
        XCTAssertEqual(11, result.1)
        XCTAssertEqual([1, 2, 1, 5, 4, 5], result.2)
        
    }
    
    // MARK:- Unit test for Wrong Input in UI for EX: entering alphabats
    func testFindLowestPathWithWrongMatrix()
    {
        let inputString = "3,4,1,2,8,6\n6,1,8,2,7,4\n5,9,3,9,9,5\n8,4,1,3,2,6\n3,7,2,1,2,@"
        let matrix = Matrix.init(input: inputString)
        XCTAssertNil(matrix)
    }
    
    // MARK:- Unit test for Empty Matrix
    func testFindLowestPathWithEmptyMatrix()
    {
        let inputString = ""
        let matrix = Matrix.init(input: inputString)
        XCTAssertNil(matrix)
    }
    
    // MARK:- Unit test for Correct Format Matrix
    func testFindLowestPathWithCorrectFormatMatrix()
    {
        let inputString = "3,4,1,2,8,6\n6,1,8,2,7,4\n5,9,3,9,9,5\n8,4,1,3,2,6\n3,7,2,1,2,6"
        let matrix = Matrix.init(input: inputString)
        XCTAssertNotNil(matrix)
    }
    
}
