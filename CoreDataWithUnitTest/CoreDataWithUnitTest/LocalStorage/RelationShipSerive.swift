//
//  RelationShipSerive.swift
//  CoreDataWithUnitTest
//
//  Created by NTG on 17/05/2023.
//

import Foundation
import CoreData
import Combine

class RelationShipService {
    
    let stack = LocalStorage.shared
    var departmentSubject = CurrentValueSubject<[DepartmentEntity], Never>([])
    func addDepartment(name: String, employees: [EmployeeEntity]) {
        let entity = DepartmentEntity(context: stack.context)
        entity.name = name
//        entity.employes = employees
        stack.save()
    }
    
    func addEmpyeeFor(depart: DepartmentEntity, employee: String) {
        let entity = EmployeeEntity(context: stack.context)
        entity.name = employee
        entity.department = depart
        stack.save()
    }
    
    func getDepartment() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            let values = try stack.context.fetch(request)
            departmentSubject.send(values)
        } catch {
            print("errr", error)
        }
         
    }
    
    func getEmployee(for depart: DepartmentEntity) -> [EmployeeEntity] {
        if let employees = depart.employes?.allObjects as? [EmployeeEntity] {
             return employees
        }
        return []
    }
}
