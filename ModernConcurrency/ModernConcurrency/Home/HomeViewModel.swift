//
//  HomeViewModel.swift
//  ModernConcurrency
//
//  Created by Ahmed Elesawy on 16/11/2022.
//

import Foundation
import Combine
import UIKit


class HomeViewModel {
    
    @Published var firstName: String?
    @Published var secondName: String?
    
   @MainActor func loadData() {
        Task {
            print("loadData 1 " , Thread.current)
           let name = await getData()
            firstName = name
            secondName = name
            print("loadData 2 " , Thread.current)
        }
        
    }
    
    func fetchData(completion: @escaping (String) ->Void) {
        $firstName.values
       
        DispatchQueue.global().async {
            print("fetchData " , Thread.current)
            sleep(2)
          
            completion("Ahmed")
        }
    }
    
    func getData() async -> String {
        return await withCheckedContinuation { continuation in
            fetchData { name in
                print("getData  " , Thread.current)
                return continuation.resume(returning: name)
            }
        }
    }
    
    func Test() async throws -> [UIImage?] {
      return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            
          var images: [UIImage?] = []
          
          for _ in 0...5 {
              group.addTask {
                try await DownloadImage().downloadAsync()
              }
          }
          
          for try await taskResult in group {
              images.append(taskResult)
          }
          return images
        }
        
       
        
    }
}
