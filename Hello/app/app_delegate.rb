class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    alert = UIAlertView.alloc.initWithTitle("RubyMotion", message: "RubyMotion is awesome!", delegate: self,
                                            cancelButtonTitle: "OK",
                                            otherButtonTitles: nil)
    alert.show

    true
  end

  def alertView(alertView, clickedButtonAtIndex: indexPath)
    puts 'clicked button'
  end
end
