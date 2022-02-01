
import UIKit
import MapKit

public class MKInvertedCircleOverlayRenderer: MKOverlayRenderer {
    
    var circle: MKCircle
    var outColor: UIColor
    
    public var outColorAlpha: CGFloat = 1.0
    public var strokeColor: UIColor = .clear
    public var strokeColorAlpha: CGFloat = 1.0
    public var strokeWith: CGFloat = 0.0
    
    // Init class
    public init(circle: MKCircle, outColor: UIColor) {
        self.circle = circle
        self.outColor = outColor
        super.init(overlay: circle)
    }
    
    // Draw paths
    public override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        let path = UIBezierPath(rect: rect(for: MKMapRect.world))
        let excludePath = UIBezierPath(roundedRect: CGRect(x: circle.coordinate.latitude, y: circle.coordinate.longitude, width: circle.boundingMapRect.size.width, height: circle.boundingMapRect.size.height), cornerRadius: circle.boundingMapRect.size.width)
        context.setFillColor(outColor.withAlphaComponent(outColorAlpha).cgColor)
        path.append(excludePath)
        context.addPath(path.cgPath)
        context.fillPath(using: .evenOdd)
        context.setLineWidth(strokeWith / zoomScale)
        context.addPath(excludePath.cgPath)
        context.setStrokeColor(strokeColor.withAlphaComponent(strokeColorAlpha).cgColor)
        context.strokePath()
        context.fillPath()
    }
}
