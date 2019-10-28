//
//  ViewController.swift
//  Cats_meaw
//
//  Created by seiu on 2019/10/25.
//  Copyright © 2019 seiu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // ねこの音源ファイルを指定
    let nekoPath01 =
        Bundle.main.bundleURL.appendingPathComponent("02_cats_01.mp3")
    let nekoPath02 =
        Bundle.main.bundleURL.appendingPathComponent("02_cats_02.mp3")
    let nekoPath03 =
        Bundle.main.bundleURL.appendingPathComponent("02_cats_03.mp3")
    let nekoPath04 =
        Bundle.main.bundleURL.appendingPathComponent("02_cats_04.mp3")
    let nekoPath05 =
        Bundle.main.bundleURL.appendingPathComponent("02_cats_05.mp3")
    let nekoPath06 =
        Bundle.main.bundleURL.appendingPathComponent("02_cats_06.mp3")
    
    // ねこのプレイヤーインスタンスを作成
    var nekoPlayer:AVAudioPlayer!
    var catsNumber = 0
    
    @IBAction func catsFace(_ sender: Any) {
        do {
            var newCatsNumber = 0
            
            // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
            // repeatは繰り返しを意味する
            
            repeat {
                // 0,1,2,3,4,5の数値をランダムに算出
                newCatsNumber = Int(arc4random_uniform(6))
                
                // 前回と同じ結果のときは再度ランダムに数値を出す
                // 異なる結果のときは、repeatを抜ける
            } while catsNumber == newCatsNumber
                
                // 新しい猫の声の結果を格納
                catsNumber = newCatsNumber
                
                if catsNumber == 0{
                    nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath01, fileTypeHint: nil)
                    } else if catsNumber == 1 {
                    nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath02, fileTypeHint: nil)
                    } else if catsNumber == 2 {
                        nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath03, fileTypeHint: nil)
                    } else if catsNumber == 3 {
                        nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath04, fileTypeHint: nil)
                    } else if catsNumber == 4 {
                        nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath05, fileTypeHint: nil)
                    } else if catsNumber == 5 {
                        nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath06, fileTypeHint: nil)
                    }
                // 猫の音源再生
                nekoPlayer.play()
            } catch {
                print("猫の音声再生でエラーが発生しました。")
                
            }
            
        }
        
        
    }
    
    


