class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @storyboard ||= UIStoryboard.storyboardWithName('MainStoryboard', bundle:NSBundle.mainBundle)
    @window.rootViewController = @storyboard.instantiateInitialViewController

    @window.makeKeyAndVisible
    true
  end
end
