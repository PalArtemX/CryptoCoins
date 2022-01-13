//
//  PortfolioDataService.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 13.01.2022.
//

import Foundation
import CoreData


class PortfolioDataService {
    private let container: NSPersistentContainer
    private let containerName = "PortfolioContainer"
    private let entityName = "PortfolioEntity"
    
    @Published var saveEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("⚠️ Error loading Core Data. 💾 \(error)")
            }
            self.getPortfolio()
        }
    }
    
    // MARK: - FUNCIONS
    // MARK: - updatePortfolio
    func updatePortfolio(coin: Coin, amount: Double) {
        // check if coin is already in portfolio
        if let entity = saveEntities.first(where: { $0.coinID == coin.id }) {
            
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
            
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    
    // MARK: - getPortfolio
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            saveEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("⚠️ Error fetching Portfolio Entities. 💾 \(error)")
        }
    }
    
    // MARK: - add
    private func add(coin: Coin, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        
        applyChange()
    }
    
    // MARK: - save
    func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("⚠️ Error saving to Core Data. 💾 \(error)")
        }
    }
    
    // MARK: - applyChange
    private func applyChange() {
        save()
        getPortfolio()
    }
    
    // MARK: - update
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChange()
    }
    
    // MARK: - delete
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChange()
    }
}
