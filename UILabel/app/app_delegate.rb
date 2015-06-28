class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    test_controller = TestController.alloc.init
    nav_controller = UINavigationController.alloc.initWithRootViewController(test_controller)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = nav_controller
    true
  end
end
