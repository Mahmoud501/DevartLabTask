//
//  DevartLabTaskTests.swift
//  DevartLabTaskTests
//
//  Created by Mahmoud Zaki on 04/06/2022.
//

import XCTest
@testable import DevartLabTask

class DevartLabTaskTests: XCTestCase {
    var storage = AppStorage.init(type: .local)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
        
    @discardableResult func testInsertUser(success: (()->())) -> Bool? {
        var request = UserRepoInOut.Insert.Request()
        let  userId = Int.random(in: 1...10000)
        request.id = userId
        request.salary = 1100
        request.name = "Dev"
        storage.userRepo?.insertUser(request: request, response: { response in
            XCTAssertEqual(response?.user?.id, userId, response?.message ?? "")
        })
        return nil
    }
    
    @discardableResult func testGetAllUsers(success: (()->())) -> Bool? {
        storage.userRepo?.getAllUser(request: nil, response: { response in
            print(response?.users?.count ?? 0)
            XCTAssertGreaterThan(response?.users?.count ?? 0, 0)
        })
        return nil
    }
    
    
    @discardableResult func testUpdateUser() -> Bool? {
        storage.userRepo?.getAllUser(request: nil, response: { response in
            let userId = response?.users?.first?.id
            var request = UserRepoInOut.Update.Request()
            request.id = userId
            request.name = "Dev Updated"
            self.storage.userRepo?.updateUser(request: request, response: { response in
                XCTAssertEqual(response?.user?.name, "Dev Updated", response?.message ?? "")
            })
        })
        return nil
    }
    
     
    func testUserLocalRepo() {
        testInsertUser {
            testGetAllUsers {
                testUpdateUser()
            }
        }
    }

}

