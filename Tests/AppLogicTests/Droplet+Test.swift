@testable import Vapor
@testable import AppLogic

func makeTestDroplet() throws -> Droplet {
    let drop = Droplet(arguments: ["dummy/path/", "prepare"])
    load(drop)
    try drop.runCommands()
    return drop
}
