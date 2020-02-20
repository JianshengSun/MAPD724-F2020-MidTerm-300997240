
import SpriteKit
import GameplayKit

class CollisionManager
{
    public static var gameViewController: GameViewController?
    
    public static func squaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y

        return Xs * Xs + Ys * Ys
    }
    
    public static func squaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) -> Void
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1HalfHeight = object1.height! * 0.5
        let P2HalfHeight = object2.height! * 0.5
        let halfHeights = P1HalfHeight + P2HalfHeight
        
        if(squaredDistance(point1: P1, point2: P2) < halfHeights * halfHeights)
        {
            if(!object2.isColliding!)
            {
                switch object2.name {
                case "island":
                    
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    if (ScoreManager.Score == 500) {
                        gameViewController!.v1.isHidden = false
                    } else if ScoreManager.Score == 1000 {
                        gameViewController!.v1.isHidden = true
                        gameViewController!.v2.isHidden = false
                    } else if ScoreManager.Score == 1500 {
                        gameViewController!.v2.isHidden = true
                        gameViewController!.v3.isHidden = false
                    } else if ScoreManager.Score == 2000 {
                        gameViewController!.v3.isHidden = true
                        gameViewController!.v4.isHidden = false
                    } else if ScoreManager.Score == 2500 {
                        gameViewController!.v4.isHidden = true
                        gameViewController!.v5.isHidden = false
                    }
                    break
                case "cloud":
                    
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    break
                default:
                    break
                }
                object2.isColliding = true
            }
        }
    }
}
