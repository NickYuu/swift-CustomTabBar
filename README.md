客製類似instagram TabBar
===

## 目的
`Tab Bar` 是我們很常使用的一個元件，但我們常常需要做到一個類似`instagram` 中間按鈕的功能，主要就是點擊中間按鈕不跳 `tab` 頁面，而是執行我們自訂的功能或頁面。

<img src="https://i.imgur.com/iLSwolv.jpg" width="200" alt="" align=center/></img>&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://i.imgur.com/fpJLF9C.jpg" width="200" alt="" align=center/></img>

如上圖，中間按鈕通常都是一個功能，而不是一個顯示資訊的頁面，今天我們來一步一步實現這樣的 `UI` 。
<!-- more -->

## 實現過程
最後結果呈現。

![](https://i.imgur.com/i6yBZwJ.gif =250x)

### 1. Storyboard
在StoryBoard中拉出一個 `TabbarController` 及五個 `ViewController` ，注意順序，如下圖icon順序。
![](https://i.imgur.com/YJBpbVe.png)

### 2. Tab Bar Controller
新增一個 `MainViewController` 繼承 `UITabBarController`，並且將 `Storyboard` 中的 `TabBarController` Class 設為`MainViewController`。
![](https://i.imgur.com/74Ili2E.png)

接著我們要在 `MainViewController` 中寫些程式，程式碼非常簡單，下面也有註解。

```swift
import UIKit

class MainViewController: UITabBarController {

var btn : UIButton = UIButton()

override func viewDidLoad() {
    super.viewDidLoad()
    setupbtn()
}

/// 設定按鈕
func setupbtn() {

    // 設定圖片
    let image = UIImage(named: "camera")
    btn.setImage(image, for: .normal)

    // 按鈕位置
    btn.frame.size = CGSize(width: 60, height: 60)
    btn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height/2 - 15)

    // 樣式設定
    let color = UIColor(red: 151/255, green: 216/255, blue: 246/255, alpha: 1)
    btn.backgroundColor = color
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 10

    // 添加按鈕
    tabBar.addSubview(btn)
    btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
}

func btnClick() {
    let vc = storyboard?.instantiateViewController(withIdentifier: "camera")
    present(vc!, animated: true, completion: nil)
}

}
```

### 3. 中間按鈕的頁面
按下中間按鈕我們要顯示一個頁面，在 Storyboard 中拉個 `ViewController` ，並將 `Class` 設定為 `CameraViewController` 如下圖。
![](https://i.imgur.com/9DThWrq.png =250x)

在 `CameraViewController` 中只要寫，按下 `Close` 按鈕後，關掉此頁面就好了。

```swift
import UIKit

class CameraViewController: UIViewController {
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
```

恭喜！這樣就完成了。

### 結語
第三個`tab`只是拿來佔位用的， `UI` 做法非常多，這邊我們比較偷懶，拉五個 `tab` 出來，有興趣的朋友也可以試試使用 `tab bar item` 中的屬性 `Title Postition` 。
![](https://i.imgur.com/kw8Er4G.png =250x)
