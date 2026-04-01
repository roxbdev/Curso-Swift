//
//  ShoppingViewModel.swift
//  Shoping
//
//  Created by Rox on 30/3/26.
//

import Foundation
import CoreData
import SwiftUI

class ShoppingViewModel: ObservableObject {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
        seedProductsIfNeeded()
    }

    // MARK: - Poblar productos de ejemplo
    func seedProductsIfNeeded() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        let count = (try? context.count(for: request)) ?? 0
        guard count == 0 else { return }

        let sampleProducts: [(String, Double)] = [
            ("Manzanas 🍎", 12.50),
            ("Leche 🥛", 18.00),
            ("Pan 🍞", 25.00),
            ("Huevos 🥚", 35.00),
            ("Café ☕", 55.00)
        ]

        for (name, price) in sampleProducts {
            let product = Product(context: context)
            product.id = UUID()
            product.name = name
            product.price = price
        }

        try? context.save()
    }

    // MARK: - Agregar al carrito
    func addToCart(product: Product) {
        let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()
        request.predicate = NSPredicate(format: "product == %@", product)

        if let existing = try? context.fetch(request).first {
            existing.quantity += 1
        } else {
            let item = CartItem(context: context)
            item.id = UUID()
            item.quantity = 1
            item.product = product
        }

        try? context.save()
    }

    // MARK: - Eliminar del carrito
    func removeFromCart(item: CartItem) {
        context.delete(item)
        try? context.save()
    }

    // MARK: - Total del carrito
    func cartTotal(items: FetchedResults<CartItem>) -> Double {
        items.reduce(0) { $0 + (($1.product?.price ?? 0) * Double($1.quantity)) }
    }
}
