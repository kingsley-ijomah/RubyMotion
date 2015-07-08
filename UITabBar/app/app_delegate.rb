class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = UIColor.whiteColor

    tabBar = UITabBarController.alloc.init
    tabBar.viewControllers = [BeerMapController.alloc.init, BeerListController.alloc.init]
    
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabBar)
    @window.makeKeyAndVisible

    true
  end
end
