import Vapor
import HTTP

final class ExampleController: ResourceRepresentable {
    func create(request: Request) throws -> ResponseRepresentable {
        let example = try request.example()
        return example
    }

    func makeResource() -> Resource<Example> {
        return Resource(
            store: create
        )
    }
}

extension Request {
    func example() throws -> Example {
        guard let json = json else { throw Abort.badRequest }
        return try Example(node: json)
    }
}
