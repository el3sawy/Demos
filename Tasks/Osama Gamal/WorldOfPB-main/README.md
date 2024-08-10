
# WorldOfPAYBACK

WorldOfPAYBACK is a startup that has raised pre-seed of 10 million dollars, we are right now one developer and looking to expand our engineering team to 6 more engineers this year, we have strong vision for our project in terms of the scaling of it in the upcoming year and amount of features that are coming.

<img src = "README Files/Screenshot_1.png" width = 380> <img src = "README Files/Screenshot_2.png" width = 380>

# Architecture Diagram
<img src = "README Files/Diagram.png" width = 850>

# Modules

**ConsumerNetworking**: This module is responsible for handling all networking requests in the application. It provides a generic networking interface to make API requests using the NetworkingType protocol.

**WOPDomain**: Domain module for sharing common interfaces with other modules, as well as  entities and usecases

**WOPDesignSystem**: The WOPDesignSystem module is a collection of reusable components, styles, and design patterns for your application. It helps maintain a consistent visual language across the app while making it easier for developers to create and update UI elements.

**WOPTransactionsListFeature**: This is a feature module, it is responsible for fetching and displaying a list of transactions. It utilizes the ConsumerNetworking module to make API requests and fetch data, this feature is build with SwiftUI, it also utilizes WOPDesignSystem for design system components usage, as well as WOPDomain for consuming use cases and entities, it also utilizes WOPTransactionsUtilities module for transactions utilities.

**WOPTransactionsUtilities**: This is a utility module, it is responsible for holding reference to some utility helpers, a logic that can be shared across features that deal with transactions, such as summing up logic

# DependencyContainer
As a main app, that is scalable in terms of accepting different features, each feature requires dependencies such as networking, configurations, toggles, and so on, this is a container for dependencies

# Unit Tests
Each module covers its own unit tests, and in the main app they are all included in the run of tests scheme
### Tests Coverage
| WOPTransactionsListFeature | WOPDomain    | WOPTransactionsUtilities   | ConsumerNetworking   |
| :---:                      | :---:        | :---:                      | :---:                |
| 62.9%                      | 56.0%        | 100%                       | 97.1%                |

# Xcode Schemas for environments
We have production schema and staging schema, they are useful when we are integrating with CI/CD such as Jenkins to build and deploy our apps, They introduce PROD and STAGING macros

# Usage
### Introducing new feature
To introduce a new feature
- Create Package of feature and add it main project packages
- Create public configure function that takes `dependencies: DependencyContainerType` parameter
- Make sure your configurator is conforming to `WOPFeature` protocol to provide necessary feature configurations

### Consume feature
To consume a feature, this should be done from the main app and not from inside dependencies
- Make sure that feature is re-configuring NeworkingType dependency using NetworkService Proxy, and re-wrap the dependencies, for example:
```
        let networkService = NetworkServiceProxy(feature: recipesListFeature)
        let dependencies = DependencyContainer(networking: networkService)
````

// -- NOTE: TODO: We are considering in the future to auto-handle configuring of features through app middleware 
