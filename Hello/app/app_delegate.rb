class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    UIAlertView.alloc.initWithTitle("Title Here..",
                                    message: "Hello World",
                                    delegate: nil,
                                    cancelButtonTitle: "OK",
                                    otherButtonTitles: nil
                                   ).show

    true
  end
end
