//
//  HomeViewModel.swift
//  CoredataRelationShips
//
//  Created by NTG Clarity on 22/06/2024.
//

import Foundation
import CoreData

final class HomeViewModel: ObservableObject {
    
    let manager = CoreDataManager.shared
    @Published var businesses: [BuisnessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BuisnessEntity>(entityName: "BuisnessEntity")
        
        do {
            businesses = try manager.context.fetch(request)
        } catch {
            print("error fetch BuisnessEntity ",error.localizedDescription)
        }
        
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try manager.context.fetch(request)
        } catch {
            print("error fetch DepartmentEntity ",error.localizedDescription)
        }
        
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try manager.context.fetch(request)
        } catch {
            print("error fetch DepartmentEntity ",error.localizedDescription)
        }
        
    }
    
    func addDepartment() {
        
        let dept = DepartmentEntity(context: manager.context)
        dept.name = "Marketing"
        dept.buisnesses = [businesses[0]]
       
        save()
    }
    
    func addEmployee() {
        let emp = EmployeeEntity (context: manager.context)
        emp.name = "KOKO"
        emp.age = 30
        emp.dateJoined = Date()
        emp.buisness = businesses[0]
        emp.department = departments[0]
        save()
    }
    
    func addNewBusiness() {
        let business = BuisnessEntity(context: manager.context)
        business.name = "Apple"
        save()
    }
    
    private func save() {
        businesses.removeAll()
        manager.save()
        getBusinesses()
        getDepartments()
        getEmployees()
    }
}
 
