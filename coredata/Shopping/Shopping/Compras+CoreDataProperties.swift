//
//  Compras+CoreDataProperties.swift
//  Shopping
//
//  Created by Rox on 4/4/26.
//
//

import Foundation
import CoreData


extension Compras {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Compras> {
        return NSFetchRequest<Compras>(entityName: "Compras")
    }

    @NSManaged public var articulos: String?
    @NSManaged public var id: UUID?
    @NSManaged public var comprado: Bool
    @NSManaged public var fecha: Date?

}

extension Compras : Identifiable {

}
