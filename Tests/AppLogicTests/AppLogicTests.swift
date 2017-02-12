import XCTest
import HTTP
import Vapor
@testable import AppLogic

class AppLogicTests: XCTestCase {
    static let allTests = [
        ("testRoot", testRoot),
        ("testExample", testExamples),
    ]
    
    func testRoot() {
        let drop = try! makeTestDroplet()
        let req = try! Request(method: .get, uri: "/")
        let res = try! drop.respond(to: req)
        let body = res.body.bytes!.string
        XCTAssertTrue(body.contains(title))
    }
    
    func testExamples() {
        let drop = try! makeTestDroplet()
        let json = try! JSON(node: .object([ "input" : "hello" ]))
        let req = try! Request(method: .post, uri: "/example", body: json.makeBody())
        let res = try! drop.respond(to: req)
        let body = res.body.bytes!.string
        XCTAssertTrue(body.contains("HELLO"))
    }
}
