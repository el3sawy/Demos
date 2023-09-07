//
//  ReportService.swift
//  ProjectCoreData
//
//  Created by Ahmed Elesawy on 22/07/2022.
//
//2022-09-12 09:29:27.302604+0200 ProjectCoreData[33991:617090] [error] error: warning snapshot_set_value_as_object called on NULL
//CoreData: error: warning snapshot_set_value_as_object called on NULL
import Foundation
import CoreData


final class StudentStorage {
    // MARK: - Properties
    var counter: Int = 0
    let coreDataStorage: CoreDataStorage
    var arr: [StudentModel] = []
    private var students: [StudentEntity] = []
    // MARK: - Initializers
    public init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }
}

extension StudentStorage: LocalStorageOperationProtocol {
    typealias T = StudentModel
    
    
    
    func save(_ item: StudentModel) {
        checker()
        coreDataStorage.viewContextBackground.performAndWait {
            let student = StudentEntity(context: coreDataStorage.viewContextBackground)
           
            student.name = item.name
            student.gender = item.gender
            student.age = item.age
            coreDataStorage.saveContext()
            print(counter)
        }
        
//        arr.append(item)
        counter += 1
    }
    
    func checker() {
        if counter == 1000 {
            let _ = fetch()
            delete(at: 0)
            
            print("Deletec \(students.count)")
            counter -= 1
        }
        
    }
    
    func fetch() -> [StudentModel] {
        
        students = coreDataStorage.fetch(type: StudentEntity.self) as! [StudentEntity]
        //
//        print(students)
//        //
//        do {
//            let studnets = try coreDataStorage.viewContext.fetch(StudentEntity.fetchRequest())
//            return studnets.map(map(_:))
//        } catch {
//            print("errrrrr")
//        }
//
        let x = students.map(map(_:))
        return x
    }
    
    
    private func map(_ student: StudentEntity) -> StudentModel {
        StudentModel(name: student.name ?? "" , age: student.age ?? "", gender: student.gender ?? "")
    }
    
    func delete(at index: Int) {
//        guard let item = students.last else {return}
        coreDataStorage.delete(item: students.last!)
    }
    
    func update(student: StudentModel, at index: Int) {
        let selectedStudent = students[index]
        selectedStudent.age = student.age
        selectedStudent.name = student.name
        selectedStudent.gender = student.gender
        coreDataStorage.saveContext()
    }
    
    func fetchWithName(name: String) -> [StudentModel] {
        let predicate = NSPredicate(format: "name CONTAINS %@", name)
        let studnets =  coreDataStorage.fetch(type: StudentEntity.self, predicate: predicate) as! [StudentEntity]
        return studnets.map(map(_:))
    }
    
    func sortByName() -> [StudentModel] {
        let studnets =  coreDataStorage.sort(by: "name", type:  StudentEntity.self) as! [StudentEntity]
        return studnets.map(map(_:))
    }
}
