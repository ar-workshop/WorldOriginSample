//
//  ViewController.swift
//  WorldOriginSample
//
//  Created by Tomoyuki Tochihira on 2023/02/03.
//

import UIKit
import ARKit

class ViewController: UIViewController {
  @IBOutlet weak var sceneView: ARSCNView!
  let config = ARWorldTrackingConfiguration()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
    self.sceneView.session.run(config)
    
    [
      [UIColor.red, SCNVector3(x: 0.5, y: 0, z: 0)],
      [UIColor.systemPink, SCNVector3(x: -0.5, y: 0, z: 0)],
      [UIColor(displayP3Red: 0, green: 0.5, blue: 0, alpha: 1), SCNVector3(x: 0, y: 0.5, z: 0)],
      [UIColor.green, SCNVector3(x: 0, y: -0.5, z: 0)],
      [UIColor.blue, SCNVector3(x: 0, y: 0, z: 0.5)],
      [UIColor(displayP3Red: 0, green: 0, blue: 0.5, alpha: 1), SCNVector3(x: 0, y: 0, z: -0.5)],
    ].forEach { colorAndVector3 in
      let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
      box.firstMaterial?.diffuse.contents = colorAndVector3.first as! UIColor
      let node = SCNNode(geometry: box)
      node.position = colorAndVector3.last as! SCNVector3
      self.sceneView.scene.rootNode.addChildNode(node)
    }
  }
}
