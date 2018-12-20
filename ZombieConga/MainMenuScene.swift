/**
* Copyright (c) 2017 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
* distribute, sublicense, create a derivative work, and/or sell copies of the
* Software in any work that is designed, intended, or marketed for pedagogical or
* instructional purposes related to programming, coding, application development,
* or information technology.  Permission for such use, copying, modification,
* merger, publication, distribution, sublicensing, creation of derivative works,
* or sale is expressly withheld.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
  let debugLayer = SKNode()
  let label = SKLabelNode(fontNamed: "Chalkduster")
  let labelInLayer = SKLabelNode(fontNamed: "Chalkduster")
  override func didMove(to view: SKView) {
    let background = SKSpriteNode.init(imageNamed: "MainMenu")
    background.position = CGPoint(x: size.width / 2, y: size.height / 2)
    addChild(background)
    
    
    label.fontSize = 100
    label.name = "welcomeLabel"
    label.text = "Tap Anywhere"
    label.position = CGPoint(x: size.width / 2, y: size.height / 3)
    label.zPosition = 1
    addChild(label)
    
    //debug for coordinate convert
    debugLayer.zPosition = 0
    
    labelInLayer.fontSize = 100
    labelInLayer.name = "Label in layer"
    labelInLayer.text = "Label in the layer"
    labelInLayer.position = CGPoint(x: size.width / 2, y: size.height / 3 * 2)
    
    debugLayer.addChild(labelInLayer)
    //        debugLayer.position = CGPoint(x: size.width / 2, y: size.height / 2)
    //        debugLayer.addChild(background)
    //        debugLayer.addChild(label)
    addChild(debugLayer)
    
    
    
    let blinkTimes = 10.0
    let duration = 3.0
    let blinkAction = SKAction.customAction(withDuration: duration, actionBlock: { node, elapsedTime in
      let slice = duration / blinkTimes
      let remainder = Double(elapsedTime).truncatingRemainder(dividingBy: slice)
      node.isHidden = remainder > slice / 2
    })
    
    label.run(blinkAction)
  }
  
  func sceneTapped() {
    let myScene = GameScene(size: size)
    myScene.scaleMode = scaleMode
    let reveal = SKTransition.doorway(withDuration: 1.5)
    view?.presentScene(myScene, transition: reveal)
  }

  override func touchesBegan(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    sceneTapped()
  }

  override func update(_ currentTime: TimeInterval) {
    debugLayer.position += CGPoint(x: 1, y: 0)
    //        print("label in scene:\(label.position)")
    //        print("label in layer:\(debugLayer.convert(labelInLayer.position, to: self))")
  }
}
