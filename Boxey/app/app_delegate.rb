class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'Boxey'
    rootViewController.view.backgroundColor = UIColor.blackColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    @blue_view = UIView.alloc.initWithFrame(CGRect.new([10, 70], [100, 100]))
    @blue_view.backgroundColor = UIColor.blueColor
    @window.addSubview(@blue_view)
    
    @add_button = UIButton.buttonWithType(UIButtonTypeSystem)
    @add_button.setTitle("Tap", forState: UIControlStateNormal)
    @add_button.layer.cornerRadius = 5
    @add_button.backgroundColor = UIColor.whiteColor
    @add_button.sizeToFit
    @add_button.frame = CGRect.new([10, @window.frame.size.height - 10 - @add_button.frame.size.height],
                                   @add_button.frame.size)
    @window.addSubview(@add_button)
    @add_button.addTarget(self, action:"add_tapped", forControlEvents:UIControlEventTouchUpInside)

    true
  end

  def add_tapped
    new_view = UIView.alloc.initWithFrame(CGRect.new([15, 75], [100, 100]))
    new_view.backgroundColor = UIColor.greenColor

    last_view = @window.subviews[1]

    new_view.frame = CGRect.new([last_view.frame.origin.x, last_view.frame.origin.y + last_view.frame.size.height + 10], [100, 100])
    @window.addSubview(new_view)
  end

end













