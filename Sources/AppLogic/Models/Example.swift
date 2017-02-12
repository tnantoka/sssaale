import Vapor
import Fluent
import Foundation

final class Example: Model {
    var id: Node?

    var input: String
    var output: String {
        return input.uppercased()
    }
    
    init(input: String) {
        id = UUID().uuidString.makeNode()
        self.input = input
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        input = try node.extract("input")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "input": input,
            "output": output,
        ])
    }
}

extension Example: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }

    static func revert(_ database: Database) throws {
        //
    }
}
