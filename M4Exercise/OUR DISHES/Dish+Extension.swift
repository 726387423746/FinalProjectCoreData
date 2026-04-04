import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        for menuItem in menuItems {
            let dish = Dish(context: context)
            dish.name = menuItem.title
            dish.price = Float(menuItem.price) ?? 0.0
        }
        try? context.save()
    }
}
