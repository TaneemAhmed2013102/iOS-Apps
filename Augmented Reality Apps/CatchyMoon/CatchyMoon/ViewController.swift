//
//  ViewController.swift
//  CatchyMoon
//
//  Created by Taneem Ahmed on 21/6/25.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    var moonArray = [SCNNode]()
    @IBOutlet var sceneView: ARSCNView!
    
    
    @IBAction func sendBackMoon(_ sender: UIBarButtonItem) {
        for i in moonArray{
            i.removeFromParentNode()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //Debugging
        //self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch = touches.first {
        let touchLocation = touch.location(in: sceneView)
          guard let query = sceneView.raycastQuery(from: touchLocation, allowing: .existingPlaneInfinite, alignment: .any) else {
          return
          }
          let result = sceneView.session.raycast(query)


          if !result.isEmpty {
              print("Touched the plane: \(result)")
              if let hitResult = result.first{
                  addMoon(hitResult)
              }
          } else {
            print("Touched somewhere else")
          }
        }
      }
    
    func addMoon(_ location: ARRaycastResult){
       
        //SHAPE AND THE MATERIAL DETAILS
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        sphere.materials = [material]
        
        //POSITION
        let node = SCNNode()
        node.position = SCNVector3(
            location.worldTransform.columns.3.x,
            location.worldTransform.columns.3.y + node.boundingSphere.radius,
            location.worldTransform.columns.3.z
        )
        
        node.geometry = sphere
        
        moonArray.append(node)
        
        //ADDING THE OBJECT TO THE SCENEVIEW WITH DEFAULT LIGHTING
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
    }
    
    // MARK: - ARSCNViewDelegate
       
       func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
           
           if anchor is ARPlaneAnchor {
               
               print("plane detected")
               
//               let planeAnchor = anchor as! ARPlaneAnchor
//
//               let plane = SCNPlane(width: CGFloat(planeAnchor.planeExtent.width), height: CGFloat(planeAnchor.planeExtent.height))
//               
//               let gridMaterial = SCNMaterial()
//               gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
//               plane.materials = [gridMaterial]
//               
//               let planeNode = SCNNode()
//
//               planeNode.geometry = plane
//               planeNode.position = SCNVector3(planeAnchor.center.x, 0 , planeAnchor.center.z)
//               planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
//               
//               node.addChildNode(planeNode)
               
           } else {
               return
           }
           
           //guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
       }
}
