# IPSAssignment 

# Features
- Show list of lessons from remote 
- Show cachedlist when you are offline
- When open app first time and you don't have internet connection show error view with the specified error
[also there is pull to refresh so when the intnet back you can refresh without closing the app and re open it ]
- Show lesson Details screen 
- When click downlaod button the video start downloading 
- During the downloading the progress appears indecate the acual video downlaoded bits 
- When click cancel download the downlaoding process terminated you can notice that also on xcode logs 
- When click on video open the video player with full options 
- Screen rotatation works well 
- Next lesson button show next lesson in the list [ when you reach the last lesson the next button disappears ]
* The logic i followed  when lauching the app i fetch lesson list from remote and save it in coredata First then fetch from code data,
 when open app seconde time i fetch from remote first then if there is any update [ i save the updated lessons only in coredata ] ,
 when the app is offline i get fetch from coredata 
* Opening the video every time i open th video i chech [if it's cached ot not even if there is intenet connection] if cached open from cache if not 
open using intenet connection data , if the video not cached an no internet i show message please connect to intenet 

- Why i followed this logic : t
# Framework used
- Coredata for caching the data 
- AVFoundation and AVKit for opening the video view 

# Third party libraries
- Just Kingfisher SPM for caching images 

#  Code Style
- I am implementing the lesson list swit MVVM-C  and lesson details with just MVVM But i am using INPUT/OUTPUT to make the code more cleaner 

# Tests 
- lessons list view model, usecase, dataSources unite tests 
- lesson details vide model unite tests

# API reference
- https://iphonephotographyschool.com/test-api/lessons

# Screenshots
![simulator_screenshot_3828FE95-2171-4B2F-88A7-1E466B13F3E8](https://user-images.githubusercontent.com/17813115/227915761-4bfc1f17-4273-4ac2-ab11-00c81cc7fdc3.png)
![simulator_screenshot_1AE48E56-707C-466C-81F5-CA580D8137F9](https://user-images.githubusercontent.com/17813115/227916021-32c8a36f-2804-4d94-9cb7-385a44ec48e9.png)
![simulator_screenshot_9A454DA8-42F6-401D-85BE-0D218E4D4B31](https://user-images.githubusercontent.com/17813115/227915846-e428b5ae-d97f-4535-96d5-426986413836.png)
![simulator_screenshot_0B236D1C-B9FB-47E1-AA1F-0AE648F97C5E](https://user-images.githubusercontent.com/17813115/227915543-1c9383f5-6cfa-4ee4-b2e5-36173fec2478.png)
![simulator_screenshot_03922E25-27AD-4B71-8D8A-7FF0645694E6](https://user-images.githubusercontent.com/17813115/228054293-48618e11-2136-45b6-b132-c1c509195bb3.png)

https://ipsmedia.notion.site/iOS-Developer-Test-36ec3cda5f95461ea78897fed1b2d080
