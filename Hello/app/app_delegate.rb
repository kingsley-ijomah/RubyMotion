class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @alert = UIAlertView.alloc.initWithTitle("RubyMotion", 
                                            message: "RubyMotion is awesome!", 
                                            delegate: self,
                                            cancelButtonTitle: "Cancel",
                                            otherButtonTitles: nil)
    @alert.addButtonWithTitle 'Sign in'
    @alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput
    @alert.show
    true
  end

  def alertView(alertView, clickedButtonAtIndex: indexPath)
    puts @alert.numberOfButtons
    puts @alert.buttonTitleAtIndex indexPath
  end
end
