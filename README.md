# MKInvertedCircleOverlay

With MKInvertedCircleOverlay you can add inverted circles to a ```MKMapView``` in Swift. You have the possibility to set several parameters.

## Features

- [x] Create inverted circles
- [x] Change the out color & alpha
- [x] Change the stroke color & alpha
- [x] Change stroke with

## Installation

You can install MKInvertedCircleOverlay with the Swift Package Manager.

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/Technikabo/MKInvertedCircleOverlay.git", from: "1.0.0")
    ],
)
```

## How To Use

**1.** Import MKInvertedCircleOverlay

```swift
import MKInvertedCircleOverlay
```

**2.** Create outlet for MKMapView

```swift
@IBOutlet weak var map: MKMapView!
```

**3.** Set map delegate in ```viewDidLoad()``` and add ```MKMapViewDelegate```to your ViewController

```swift
map.delegate = self
```

**4.** Add overlay

```swift
let coordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
map.addOverlay(MKCircle(center: coordinate, radius: 1500))
```

**4.** Add MKOverlayRenderer function

```swift
func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    let circle = MKInvertedCircleOverlayRenderer(circle: overlay as! MKCircle, outColor: .darkGray)
    return circle
}
```

## Change color and alpha

```swift
circle.outColorAlpha = 0.2
circle.strokeColorAlpha = 1.0
circle.strokeWith = 10.0
```
