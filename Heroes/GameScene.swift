

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var width: CGFloat!
    var height: CGFloat = 9
    var boxSize: CGFloat!
    var gridStart: CGPoint!
    
    // MARK: - SKScene
    
    override func didMoveToView(view: SKView) {
       createGrid()
    }
    
    //MARK: Setup
    
    func createGrid() {
        let grid = SKNode() // create a node to hold all grid squares
        
        let usableWidth = size.width * 0.9 // we only want to use 90% of the width available
        let usableHeight = size.height * 0.8 // we only want to use 80% of the height available
        
        boxSize = usableHeight / height // calculate the box size based on requested height
        
        width = CGFloat(Int(usableWidth / boxSize)) // calculate number of boxes along the x axis based on boxSize
        
        let offsetX = (size.width - boxSize * width) / 2 // used to center the grid horizontally
        let offsetY = (size.height - boxSize * height) / 2 // used to center the grid vertically
        
        // loop through the entire grid
        for col in 0 ..< Int(width) {
            for row in 0 ..< Int(height) {
                // box creation
                let path = UIBezierPath(rect: CGRect(x: boxSize * CGFloat(col), y: boxSize * CGFloat(row), width: boxSize, height: boxSize))
                let box = SKShapeNode(path: path.CGPath)
                box.strokeColor = UIColor.grayColor()
                box.alpha = 0.3
                grid.addChild(box)
            }
        }
        
        gridStart = CGPointMake(offsetX, offsetY) // set gridStart for later use
        grid.position = CGPointMake(offsetX, offsetY) // set the grid position, centered in view
        addChild(grid) // add the grid to the scene
    }
    
    
    // MARK: Touch Handling
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        handleTouches(touches)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        handleTouches(touches)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        handleTouches(touches)
    }
    
    private func handleTouches(touches: Set<UITouch>) {

    }
    
    
    // MARK - Updates
    
    override func didSimulatePhysics() {

    }
   
    
    
    // MARK: - SKPhysicsContactDelegate
    
    func didBeginContact(contact: SKPhysicsContact) {
        // 1. Create local variables for two physics bodies
        /*
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        // 2. Assign the two physics bodies so that the one with the lower category is always stored in firstBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 3. react to the contact between the two nodes
        if firstBody.categoryBitMask == player?.physicsBody?.categoryBitMask &&
            secondBody.categoryBitMask == zombies[0].physicsBody?.categoryBitMask {
                // Player & Zombie
                gameOver(false)
        } else if firstBody.categoryBitMask == player?.physicsBody?.categoryBitMask &&
            secondBody.categoryBitMask == goal?.physicsBody?.categoryBitMask {
                // Player & Goal
                gameOver(true)
        }
        */
    }
    
    
    // MARK: Helper Functions
    
    private func gameOver(didWin: Bool) {

    }
    
}
