# Robusta iOS assignment


In the assignment, I tried to show how architectural patterns **MVVM** and **Clean Architecture** can be applied.

After grouping all layers, I splitted the app into 3 layers: **Presentation, Domain and Data layers.**

### Data Flow
1. **View(UI)** calls method from **ViewModel** (Presenter).
2. **ViewModel** executes **Use Case**.
3. **Use Case** combines data from *Repositories*.
4. Each **Repository** returns data from a Remote Data (Network).
5. Information flows back to the **View(UI)** where we display the list of items.


### Testing
I covered **Domain and Data Layer** and most important parts in **Presentation layer** (ViewModel).

### Notes
- No third parties used in the app, all packages are written native.
- App supports offline data loading (Caching).
- I didn't have enough time to implement pagination, It should be handeled from repository in data layer and required implementing database like "CoreData".

### Stories
[Stories](https://github.com/HussamElsadany/RobustaTask/blob/main/Stories.md)
