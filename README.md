# PlayoDemo
Demo Project to display news headlines.

#Tools used
1. Xcode IDE - Used to develop the application

2. GIT - Used for source code management.

3. Cocoapods - Dependency manager used for integrating third party libraries.

4. Simulator - Build and run the application.

5. Instruments - Used to analyse any memory leaks.

# Project Contents
1. Extension - UIApplication extension created to resolve keywindow warning.

2. Helper - Third Party Library "NUKE" used for downloading and caching of images using image url for better performance.

3. Model - News API response model for mapping of data fetched from API to Codables.

4. Networking - Third Party Library "Moya" a wrapper to URLSession and Alomafire used to trigger Network calls in the application. URL session is not used in this application because I wanted to demonstrate the using of Moya as it gives the ability to the developer to write structured code.

5. View - View has all the controllers, custom views and storyboard.

6. PlayDemoTests - Test case for API call.

# Architecture
This project follows a new architecture proposed by me which has a layer on top of MVVM architecture. It has a separate controller for handling UI operations which makes code supper loosely coupled.



