import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        // CHECKING WHETHER THE DISH EXISTS OR NOT
        for menuItem in menuItems {
            if let exists = Dish.exists(name: menuItem.title, context) {
                if exists == true {
                    continue
                }
            }
            let dish = Dish(context: context)
            dish.name = menuItem.title
            dish.price = Float(menuItem.price) ?? 0.0
        }
        try? context.save()
    }
}
