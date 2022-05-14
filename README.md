# Ahoy Movement Studio
## AhoyNave iOS SDK



The AhoyNave iOS SDK is built to provide seamless integration of Navigation along with Map functionalites into your app


## Features

- Display a Map with zoom and pan funtionality
- Add markers to the map
- Add a polyline
- Add a polygon
- Load custom themes(Day/Night) etc
- Navigate from source to destination
- Restricting the route



## Installation

  Signup for **Ahoy Movement Studio** and obtain a **Subscription Key**, you can do so by signing up [here](https://ams.ahoy.technology)
  The **AhoyNave** SDK for iOS can be downloaded through **Cocoapods**
  
  - Install cocoapods on your mac(if you dont have it installed already) by running the following command on the terminal
        ```
    sudo gem install cocoapods
        ```   
- Once the cocoapods on installed navigate to the project directory and create a pod by running the following command in the terminal
       ```
    pod init
        ``` 
- Open the  file in text editor and add the spec source at the top and the pod name  

    ```
    source 'https://github.com/CocoaPods/Specs' 
        target 'TestApp' do
        use_frameworks!
            # Pods for App
            pod 'AhoyNave'
        end
    ``` 
- Now open the terminal and run the following command in the terminal

     ```
      pod install
     ``` 

## Usage
- Open **AppDelegate** file of your project and add the following

    ```
      import AhoyNave
    ``` 
- Add the SDK initialisation function in the **didFinishLaunchingWithOptions** function of the **AppDelegate**, the SDK can be initialised through this function

    ```
       AhoySDKManager.shared()
            .ahoySDKKey("YOUR_AMS_SUBSCRIPTION_KEY")
            .headerBackgroundColor(.blue)
            .footerBackgroundColor(.white)
            .footerAccentColor(.black) //foreground color
            .headerAccentColor(.white)
            .setAhoyMapKitDelegate(self)
            .build()
    ```
- Conform to the **AhoySDKManagerDelegate** in App delegate by doing so

    ```
    extension AppDelegate : AhoySDKManagerDelegate {
        func didFailtoInitialiseAhoyMapKitSDK(error: Error) {
            print("AHOY MAPKIT SDK initialisation failed \(error)")
        }

        func didInitialiseAhoyMapKitSDK() {
            print("AHOY MAPKIT SDK initialisation successfull")
        }
    }
    ```
- Now run the app, you should see the AHOY MAPKIT SDK initialisation successfull message in the xcode console.

## Display a Map
- Open the info.plist and make sure you have location usage permissions by adding NSLocationWhenInUseUsageDescription key.
- The **AhoyNave SDK** offers AhoyMapView as an **IBDesignable** so all you need to do is just drop a UIView in xib/storyboard and select the custom class to AhoyMapView.
- In case if the MapView is your rootViewController, please have a look at **AhoySDKManagerDelegate** in the AppDelegate to make sure the SDK has been initialised before loading your rootViewController, you can refer to the example project for details implementation.
- You can just run the app to see the Map

## Add Polyline to the Map
- Make sure you have added AhoyMapView either through IBDesignable or through code and add the following function

    ```
         let geoCoordinatesArray = [
                CLLocationCoordinate2D(latitude: 25.301249248421456, longitude: 55.37616902442195),
                CLLocationCoordinate2D(latitude: 25.300128299818272, longitude: 55.3765823181859),
                 CLLocationCoordinate2D(latitude: 25.29977333060049, longitude: 55.375316606182395)
        ]
        
        do {
            try ahoyMapView.addPolyLine(width: 30, color: .red, coordinates: geoCoordinatesArray)
        }catch let error {
            print("could not draw polyline")
        }
    ```
- You should now see a polyline on your map passing through the given coordinates

## Add Polygon to the Map
- You can add a polygon on the map by using **addPolyLine** function of the AhoyMapView, sample implementation is as follows

    ```
         let geoCoordinatesArray = [
            CLLocationCoordinate2D(latitude: 25.301249248421456, longitude: 55.37616902442195),
            CLLocationCoordinate2D(latitude: 25.300128299818272, longitude: 55.3765823181859),
            CLLocationCoordinate2D(latitude: 25.29977333060049, longitude: 55.375316606182395)
        ]
        do {
            try ahoyMapView.addPolygon(color: .red, coordinates: geoCoordinatesArray)        
        }catch let error {
            print("could not draw polyline")
        }
    ```
## Add Pin Annotation to the Map
- The point annotation can be added to the map using the **addPointAnnotation** function of the AhoyMapView, the sample implementation is as follows

    ```
      do {
            try ahoyMapView.addPointAnnotation(location: CLLocationCoordinate2D(latitude: 25.301249248421456, longitude: 55.37616902442195), image: pinImage)
        } catch let error {
            print("could not add point annotation")
        }
    ```
 ### Navigate to destination using coordinates
 - The navigate feature of AhoyNave SDK helps you in seamless integration of navigation functionality in no time, here is all you need to do to have the navigation feature up and running
 - Open your view controller and add the following
 
    ```
        let destinationLocation = CLLocation(latitude: 25.327396542469668, longitude: 55.38771042802632)
        AhoyMapManager.shared().launchAhoyMaps(destinationLocation: destinationLocation)
    ```
### Navigate to destination using TripID
- If you have a TripID using which you can restict the user to follow your trip, the navigation feature with TripID can be integrated as follows
  
     ```
        let currentTripId = "Afisb6-3dfhr-hfghdgf-bdhfbi"
        AhoyMapManager.shared().launchAhoyMaps(tripID: currentTripId)
     ```

