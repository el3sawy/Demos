//
//  DemoViewController.swift
//  LayoutTests
//
//  Created by Ahmed Naguib on 30/10/2023.
//

import UIKit

class DemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            

            if let jsonData = json.data(using: .utf8) {
                let filters = try JSONDecoder().decode(Welcome3.self, from: jsonData)
                play(filter: filters.filtersList ?? [])
                }
               
        } catch {
            print(error)
        }
    }
    
    
    func play(filter: [FiltersList]) {
//        let filterIndex = filter.firstIndex(where: { $0.filterTypes })
    }
    
}

let json = """
{
  "filtersList": [
    {
      "title": "Filter By",
      "type": "filter",
      "filterTypes": [
        {
          "name": "Explore",
          "type": "explore",
          "isMultipleSelection": true,
          "filterValues": [
            {
              "name": "NewlyAdded",
              "filterKey": "explore",
              "filterValue": "1",
              "parentTitle": "Explore",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            },
            {
              "name": "Buy one Get one ",
              "filterKey": "explore",
              "filterValue": "2",
              "parentTitle": "explore",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            }
          ]
        },
        {
          "name": "Rating",
          "type": "rating",
          "isMultipleSelection": true,
          "filterValues": [
            {
              "name": "4.5+",
              "filterKey": "rating",
              "filterValue": "1",
              "parentTitle": "Rating",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            },
            {
              "name": "3.5+",
              "filterKey": "rating",
              "filterValue": "2",
              "parentTitle": "Rating",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            }
          ]
        },
        {
          "name": "Price",
          "type": "price",
          "isMultipleSelection": true,
          "filterValues": [
            {
              "name": "$",
              "filterKey": "price",
              "filterValue": "1",
              "parentTitle": "price",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            },
            {
              "name": "$$",
              "filterKey": "price",
              "filterValue": "2",
              "parentTitle": "price",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            },
            {
              "name": "$$$",
              "filterKey": "price",
              "filterValue": "3",
              "parentTitle": "price",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            }
          ]
        },
        {
          "name": "Dietery",
          "type": "dietery",
          "isMultipleSelection": true,
          "filterValues": [
            {
              "name": "4.5+",
              "filterKey": "vegeterian",
              "filterValue": "1",
              "parentTitle": "Dietery",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            },
            {
              "name": "3.5+",
              "filterKey": "Gluten Free",
              "filterValue": "2",
              "parentTitle": "Dietery",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            },
            {
              "name": "3.5+",
              "filterKey": "halal",
              "filterValue": "3",
              "parentTitle": "Dietery",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            }
          ]
        }
      ]
    },
    {
      "title": "Cusines",
      "type": "cusines",
      "filterTypes": [
        {
          "name": "Cusines",
          "isMultipleSelection": true,
          "filterValues": [
            {
              "name": "NewlyAdded",
              "filterKey": "explore",
              "filterValue": "1",
              "parentTitle": "Explore",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            },
            {
              "name": "Buy one Get one ",
              "filterKey": "explore",
              "filterValue": "2",
              "parentTitle": "explore",
              "image": "https://cdn.eateasily.com/cuisines/mamba/161.jpg",
              "smallImage": "https://cdn.eateasily.com/cuisines/mamba/64x64/161.jpg"
            }
          ]
        }
      ]
    }
  ]
}
"""
struct Welcome3: Codable {
    let filtersList: [FiltersList]?
}

// MARK: - FiltersList
struct FiltersList: Codable {
    let title, type: String?
    let filterTypes: [FilterType]?
}

// MARK: - FilterType
struct FilterType: Codable {
    let name, type: String?
    let isMultipleSelection: Bool?
    let filterValues: [FilterValue]?
}

// MARK: - FilterValue
struct FilterValue: Codable {
    let name, filterKey, filterValue, parentTitle: String?
    let image, smallImage: String?
}
