//
//  ViewController.swift
//  Cats_meaw
//
//  Created by seiu on 2019/10/25.
//  Copyright © 2019 seiu. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // AdMob
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-8285428500615343/1707576995"
         bannerView.rootViewController = self
        bannerView.load(GADRequest())

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
    
    // 赤ちゃんねこの音源ファイルを指定
    let babyNekoPath01 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby01.mp3")
    let babyNekoPath02 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby02.mp3")
    let babyNekoPath03 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby03.mp3")
    let babyNekoPath04 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby04.mp3")
    let babyNekoPath05 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby05.mp3")
    let babyNekoPath06 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby06.mp3")
    let babyNekoPath07 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby07.mp3")
    let babyNekoPath08 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby08.mp3")
    let babyNekoPath09 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby09.mp3")
    let babyNekoPath10 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby10.mp3")
    let babyNekoPath11 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby11.mp3")
    let babyNekoPath12 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby12.mp3")
    let babyNekoPath13 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby13.mp3")
    let babyNekoPath14 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby14.mp3")
    let babyNekoPath15 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby15.mp3")
    
    // 赤ちゃんねこちゃん"ず"の音源ファイルを指定
    let babyNekoManyPath01 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_01.mp3")
    let babyNekoManyPath02 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_02.mp3")
    let babyNekoManyPath03 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_03.mp3")
    let babyNekoManyPath04 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_04.mp3")
    let babyNekoManyPath05 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_05.mp3")
    let babyNekoManyPath06 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_06.mp3")
    let babyNekoManyPath07 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_07.mp3")
    let babyNekoManyPath08 =
        Bundle.main.bundleURL.appendingPathComponent("Cat_Baby_many_08.mp3")

    // ねこのプレイヤーインスタンスを作成
    var nekoPlayer:AVAudioPlayer!
    var catsNumber = 0
    
    // これなんだっけ...
    @IBOutlet weak var catButton: UIButton!
    
    // 猫の顔を押した時に実行される
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
                
            
            switch catsNumber {
            case 0:
                nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath01, fileTypeHint: nil)
            case 1:
                nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath02, fileTypeHint: nil)
            case 2:
                nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath03, fileTypeHint: nil)
            case 3:
                nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath04, fileTypeHint: nil)
            case 4:
                nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath05, fileTypeHint: nil)
            default:
                nekoPlayer = try AVAudioPlayer(contentsOf: nekoPath06, fileTypeHint: nil)
            }
            nekoPlayer.delegate = self
                // 猫の音源再生
                nekoPlayer.play()
            } catch {
                print("猫の音声再生でエラーが発生しました。")
            }
        }
    // 赤ちゃん猫の顔を押した時に実行される
    @IBAction func catBabyButton(_ sender: Any) {
        do {
            var newCatsNumber = 0
            repeat {
                newCatsNumber = Int(arc4random_uniform(15))
            
            // 前回と同じ結果ときは再度ランダムに数値を出す
            // 異なる結果のときは、repeatを抜ける
        } while catsNumber == newCatsNumber
            
            // 新しい猫の声の結果を格納
            catsNumber = newCatsNumber
        
        switch catsNumber {
        case 0:
                nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath01, fileTypeHint: nil)
        case 1:
                nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath02, fileTypeHint: nil)
            case 2:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath03, fileTypeHint: nil)
            case 3:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath04, fileTypeHint: nil)
            case 4:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath05, fileTypeHint: nil)
            case 5:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath06, fileTypeHint: nil)
            case 6:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath07, fileTypeHint: nil)
            case 7:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath08, fileTypeHint: nil)
            case 8:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath09, fileTypeHint: nil)
            case 9:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath10, fileTypeHint: nil)
            case 10:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath11, fileTypeHint: nil)
            case 11:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath12, fileTypeHint: nil)
            case 12:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath13, fileTypeHint: nil)
            case 13:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath14, fileTypeHint: nil)
        default:
                nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoPath15, fileTypeHint: nil)
        }
        nekoPlayer.play()
    } catch {
        print("赤ちゃん猫の声再生でエラーが発生しました。")
        }
    }
    
    // 赤ちゃん猫ちちゃんずの顔を押した時に実行される
    @IBAction func catBabyManyButton(_ sender: Any) {
        do {
            var newCatsNumber = 0
            repeat {
                newCatsNumber = Int(arc4random_uniform(8))
                
                // 前回と同じ結果のときは再度ランダムに数値を出す
                // 異なる結果のときは、repeatを抜ける
            } while catsNumber == newCatsNumber
            // 新しい猫の声の結果を格納
            catsNumber = newCatsNumber
            
            switch catsNumber {
            case 0:
           nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath01, fileTypeHint: nil)
            case 1:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath02, fileTypeHint: nil)
            case 2:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath03, fileTypeHint: nil)
            case 3:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath04, fileTypeHint: nil)
            case 4:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath05, fileTypeHint: nil)
            case 5:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath06, fileTypeHint: nil)
            case 6:
                    nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath07, fileTypeHint: nil)
            default:
                nekoPlayer = try AVAudioPlayer(contentsOf: babyNekoManyPath08, fileTypeHint: nil)
            }
            //音量を倍にする。
            nekoPlayer.volume = 2
            nekoPlayer.play()
        } catch {
            print("赤ちゃん猫ちゃんずをの声再生でエラーが発生しました。")
        }
    }
    
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard flag else { return }
        print("finished")
    }
        
    func addBannerViewToView(_ bannerView: GADBannerView) {
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(bannerView)
     view.addConstraints(
       [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
    }
    
}
    
    


