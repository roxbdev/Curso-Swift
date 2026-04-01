//
//  Compras+CoreDataProperties.swift
//  CoreDataCompras
//
//  Created by App Designer2 on 08.03.25.
//
//

import Foundation
import CoreData


extension Compras {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Compras> {
        return NSFetchRequest<Compras>(entityName: "Compras")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var articulos: String?
    @NSManaged public var comprado: Bool
    @NSManaged public var fecha: Date?

}

extension Compras : Identifiable {

}
