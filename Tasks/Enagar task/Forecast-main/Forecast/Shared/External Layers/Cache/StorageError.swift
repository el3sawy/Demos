//
//  StorageError.swift
//  Forecast
//
//  Created by Mohammed Elnaggar on 07/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import Foundation

public enum StorageError: Error {
  case notFound
  case cantWrite(Error)
  case cantDelete(StorageKey)
}
