//
//  GameManager.swift
//  testgame
//
//  Created by Summer on 7/31/19.
//  Copyright © 2019 sophia mullaney. All rights reserved.
//

import SpriteKit

class GameManager {
    
    var scene: GameScene!
    //1
    var nextTime: Double?
    //1
    var timeExtension: Double = 0.15
    //1
    var playerDirection: Int = 1
    //1
    var currentScore: Int = 0

    init(scene: GameScene) {
        self.scene = scene
    }
    

    //1
    func initGame() {
        //starting player position
        scene.playerPositions.append((10, 10))
        scene.playerPositions.append((10, 11))
        scene.playerPositions.append((10, 12))
        renderChange()
        //2
        generateNewPoint()
    }
    
    //3
    private func generateNewPoint() {
        var randomX = CGFloat(arc4random_uniform(19))
        var randomY = CGFloat(arc4random_uniform(39))
        //4
        while contains(a: scene.playerPositions, v: (Int(randomX), Int(randomY))) {
            randomX = CGFloat(arc4random_uniform(19))
            randomY = CGFloat(arc4random_uniform(39))
        }
        scene.scorePos = CGPoint(x: randomX, y: randomY)
    }
    
    //2
    func update(time: Double) {
        if nextTime == nil {
            nextTime = time + timeExtension
        } else {
            if time >= nextTime! {
                nextTime = time + timeExtension
                //2
                updatePlayerPosition()
                //2
                checkForScore()
                //1
                checkForDeath()
                //1
                finishAnimation()
            }
        }
    }
    
    //2
    private func finishAnimation() {
        if playerDirection == 0 && scene.playerPositions.count > 0 {
            var hasFinished = true
            let headOfSnake = scene.playerPositions[0]
            for position in scene.playerPositions {
                if headOfSnake != position {
                    hasFinished = false
                }
            }
            if hasFinished {
                print("end game")
                //new code
                updateScore()
                playerDirection = 4
                //animation has completed
                scene.scorePos = nil
                scene.playerPositions.removeAll()
                renderChange()
                //return to menu
                scene.currentScore.run(SKAction.scale(to: 0, duration: 0.4) {
                    self.scene.currentScore.isHidden = true
                    }
                    scene.gameBG.run(SKAction.scale(to: 0, duration: 0.4)) {
                        self.scene.gameBG.isHidden = true
                        self.scene.gameLogo.isHidden = false
                        self.scene.gameLogo.run(SKAction.move(to: CGPoint(x: 0, y: (self.scene.frame.size.height / 2) - 200), duration: 0.5)) {
                            self.scene.playButton.isHidden = false
                            self.scene.playButton.run(SKAction.scale(to: 1, duration: 0.3))
                            self.scene.bestScore.run(SKAction.move(to: CGPoint(x: 0, y: self.scene.gameLogo.position.y - 50), duration: 0.3))
                        }
                }
            }
        }
    }
    
    
    //2
    private func checkForDeath() {
        if scene.playerPositions.count > 0 {
            var arrayOfPositions = scene.playerPositions
            let headOfSnake = arrayOfPositions[0]
            arrayOfPositions.remove(at: 0)
            if contains(a: arrayOfPositions, v: headOfSnake) {
                playerDirection = 0
            }
        }
    }
    
    //3
    private func checkForScore() {
        if scene.scorePos != nil {
            let x = scene.playerPositions[0].0
            let y = scene.playerPositions[0].1
            if Int((scene.scorePos?.x)!) == y && Int((scene.scorePos?.y)!) == x {
                currentScore += 1
                scene.currentScore.text = "Score: \(currentScore)"
                generateNewPoint()
                scene.playerPositions.append(scene.playerPositions.last!)
                scene.playerPositions.append(scene.playerPositions.last!)
                scene.playerPositions.append(scene.playerPositions.last!)

            }
        }
    }
    
    //3
    private func updatePlayerPosition() {
        //4
        var xChange = -1
        var yChange = 0
        //5
        switch playerDirection {
        case 1:
            //left
            xChange = -1
            yChange = 0
            break
        case 2:
            //up
            xChange = 0
            yChange = -1
            break
        case 3:
            //right
            xChange = 1
            yChange = 0
            break
        case 4:
            //down
            xChange = 0
            yChange = 1
        //4
        case 0:
            //dead
            xChange = 0
            yChange = 0
            break
            default:
            break
        }
        //6
        if scene.playerPositions.count > 0 {
            var start = scene.playerPositions.count - 1
            while start > 0 {
                scene.playerPositions[start] = scene.playerPositions[start - 1]
                start -= 1
            }
            scene.playerPositions[0] = (scene.playerPositions[0].0 + yChange, scene.playerPositions[0].1 + xChange)
        }
        //1
        if scene.playerPositions.count > 0 {
            let x = scene.playerPositions[0].1
            let y = scene.playerPositions[0].0
            if y > 40 {
                scene.playerPositions[0].0 = 0
            } else if y < 0 {
                scene.playerPositions[0].0 = 40
            } else if x > 20 {
                scene.playerPositions[0].1 = 0
            } else if x < 0 {
                scene.playerPositions[0].1 = 20
            }
        }
        
        //7
        renderChange()
    }
    
    //2
    func renderChange() {
        for (node, x, y) in scene.gameArray {
            if contains(a: scene.playerPositions, v: (x,y)) {
                node.fillColor = SKColor.cyan
            } else {
                node.fillColor = SKColor.clear
                //4
                if scene.scorePos != nil {
                    if Int((scene.scorePos?.x)!) == y && Int((scene.scorePos?.y)!) == x {
                        node.fillColor = SKColor.red
                    }
                }
            }
        }
    }
    
    //3
    func contains(a:[(Int, Int)], v:(Int,Int)) -> Bool {
        let (c1, c2) = v
        for (v1, v2) in a { if v1 == c1 && v2 == c2 { return true } }
        return false
    }
    
}
