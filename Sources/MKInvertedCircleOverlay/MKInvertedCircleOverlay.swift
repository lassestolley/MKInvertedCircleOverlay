//
//  MKInvertedCircleOverlay.swift
//  MKInvertedCircleOverlay
//
//  Created by Lasse Stolley on 11.04.22.
//  Copyright 2022 Lasse Stolley
//  MIT License
//
//  https://github.com/lassestolley/MKInvertedCircleOverlay
//

import MapKit

public class MKInvertedCircleOverlayRenderer: MKOverlayRenderer {
    
    // MKCircle
    var circle: MKCircle
    
    // Configuration
    public var outColor: UIColor = .systemBlue
    public var outAlpha: CGFloat = 1.0
    public var strokeColor: UIColor = .clear
    public var strokeAlpha: CGFloat = 1.0
    public var strokeWidth: CGFloat = 0.0
    
    // Init class
    public init(circle: MKCircle) {
        self.circle = circle
        super.init(overlay: circle)
    }
    
    // Draw paths
    public override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        let path = UIBezierPath(rect: rect(for: MKMapRect.world))
        let excludePath = UIBezierPath(roundedRect: CGRect(x: circle.coordinate.latitude, y: circle.coordinate.longitude, width: circle.boundingMapRect.size.width, height: circle.boundingMapRect.size.height), cornerRadius: circle.boundingMapRect.size.width)
        context.setFillColor(outColor.withAlphaComponent(outAlpha).cgColor)
        path.append(excludePath)
        context.addPath(path.cgPath)
        context.fillPath(using: .evenOdd)
        context.setLineWidth(strokeWidth / zoomScale)
        context.addPath(excludePath.cgPath)
        context.setStrokeColor(strokeColor.withAlphaComponent(strokeAlpha).cgColor)
        context.strokePath()
        context.fillPath()
    }
}
