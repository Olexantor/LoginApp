//
//  ModelForEverything.swift
//  LoginApp
//
//  Created by Александр on 07.02.2021.
//

struct Person {
    let name: String
    let surname: String
    let patronymic: String
}

struct User {
    let userName: String
    let password: String
    var person: Person
}

extension User {
    static func getInfo() -> User {
        User(
            userName: "User",
            password: "Password",
            person: Person(
                name: "Александр",
                surname: "Николаев",
                patronymic: "Александрович"
            )
        )
    }
}

