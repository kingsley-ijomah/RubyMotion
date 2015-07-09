class TaskController < UIViewController
  def viewDidLoad
    super
    toolbar = UIToolbar.alloc.initWithFrame([[0, 30],[self.view.size.width, 44]])
    toolbar.tintColor = UIColor.blueColor
    toolbar_button_1 = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh, target: self, action: :testMe)
    toolbar_button_2 = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemCancel, target: self, action: :testMe)
    toolbar.setItems [toolbar_button_1, toolbar_button_2], animated: true
    self.view.addSubview(toolbar)
  end

  def testMe
    puts 'I was clicked'
  end
end
