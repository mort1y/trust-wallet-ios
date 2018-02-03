// Copyright SIX DAY LLC. All rights reserved.

import UIKit

class ProtectionCoordinator: Coordinator {
    var coordinators: [Coordinator] = []
    lazy var splashCoordinator: SplashCoordinator = {
        return SplashCoordinator(window: self.protectionWindow)
    }()
    lazy var lockEnterPasscodeCoordinator: LockEnterPasscodeCoordinator = {
        return LockEnterPasscodeCoordinator(window: self.protectionWindow, model: LockEnterPasscodeViewModel())
    }()
    let protectionWindow: UIWindow
    init() {
        let protection = UIWindow()
        protection.windowLevel = UIWindowLevelStatusBar + 1.0
        self.protectionWindow = UIWindow()
    }
    func applicationWillResignActive() {
        //We should show spalsh screen when protection is on. And app is susepndet.
        splashCoordinator.start()
    }
    func applicationDidBecomeActive() {
        //We should dismiss spalsh screen when app become active.
        splashCoordinator.dismiss()
        //We track protectionWasShown becouse of the TouchId that will trigger applicationDidBecomeActive method after valdiation.
        if !lockEnterPasscodeCoordinator.protectionWasShown {
            lockEnterPasscodeCoordinator.start()
        } else {
            lockEnterPasscodeCoordinator.protectionWasShown = false
        }
    }
}
