//
//  BusinessView.swift
//  CoredataRelationShips
//
//  Created by NTG Clarity on 22/06/2024.
//

import SwiftUI

struct BusinessView: View {
    let entity: BuisnessEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(entity.name ?? "")")
            Spacer()
                .frame(height: 10)
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments")
                    .bold()
                
                ForEach(departments) { dept in
                    Text(dept.name ?? "")
                }
            }
            
            Spacer()
                .frame(height: 10)
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees")
                    .bold()
                ForEach(employees) { emp in
                    Text(emp.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300)
       
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3)))
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    BusinessView(entity: .init())
}


struct DepartmentView: View {
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(entity.name ?? "")")
            Spacer()
                .frame(height: 10)
            if let departments = entity.buisnesses?.allObjects as? [BuisnessEntity] {
                Text("Businesses")
                    .bold()
                
                ForEach(departments) { dept in
                    Text(dept.name ?? "")
                }
            }
//            
            Spacer()
                .frame(height: 10)
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees")
                    .bold()
                ForEach(employees) { emp in
                    Text(emp.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300)
       
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.green.opacity(0.3)))
        .shadow(radius: 10)
        .padding()
    }
}


struct EmployeeView: View {
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(entity.name ?? "")")
            Text("Age: \(entity.age.description)")
            Text("Data: \(entity.dateJoined?.description ?? "")")
            Spacer()
                .frame(height: 10)
            Text("Businesses")
                .bold()
            
            Text(entity.buisness?.name ?? "")
            
            Text("Departments")
                .bold()
            Text(entity.department?.name ?? "")
            

        }
        .padding()
        .frame(maxWidth: 300)
       
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.green.opacity(0.3)))
        .shadow(radius: 10)
        .padding()
    }
}
