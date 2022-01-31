
import UIKit
import MapKit

class MKInvertedCircleOverlayRenderer: MKOverlayRenderer {
    
    var circle: MKCircle
    var outColor: UIColor
    
    var outColorAlpha: CGFloat = 1.0
    var strokeColor: UIColor = .clear
    var strokeColorAlpha: CGFloat = 1.0
    var strokeWith: CGFloat = 0.0
    
    init(circle: MKCircle, outColor: UIColor) {
        self.circle = circle
        self.outColor = outColor
        super.init(overlay: circle)
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
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
