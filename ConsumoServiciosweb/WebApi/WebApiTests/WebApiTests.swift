//
//  WebApiTests.swift
//  WebApiTests
//
//  Created by Rox on 11/4/26.
//

import XCTest
@testable import WebApi

// 1. Agregamos @MainActor aquí para que los tests tengan permiso
// de tocar las propiedades del ViewModel.
@MainActor
class WebApiTests: XCTestCase {

    var viewModel: UserViewModel!

    override func setUp() {
        super.setUp()
        // Ahora sí podemos inicializarlo sin errores
        viewModel = UserViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // --- PRUEBA 1: Verificar el modelo ---
    // Esta no necesita MainActor realmente, pero al estar la clase marcada, ya funciona.
    func test_User_CreacionCorrecta() {
        let user = User(id: 1, name: "Maria", email: "maria@test.com")
        XCTAssertEqual(user.name, "Maria")
    }

    // --- PRUEBA 2: Estado inicial ---
    func test_UserViewModel_EstadoInicial() {
        XCTAssertTrue(viewModel.users.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }

    // --- PRUEBA 3: Simular carga ---
    func test_UserViewModel_AlCargarUsuarios_LaListaSeLlena() {
        let mockUsers = [User(id: 1, name: "Estudiante A", email: "a@test.com")]
        
        viewModel.users = mockUsers
        
        XCTAssertEqual(viewModel.users.count, 1)
    }
}
