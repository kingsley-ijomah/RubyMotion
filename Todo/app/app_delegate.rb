class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    todosController = TodosController.alloc.init
    todosController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(todosController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
