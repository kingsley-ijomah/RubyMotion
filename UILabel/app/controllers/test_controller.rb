class TestController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    self.view.addSubview(label)
  end

  def label
    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.text = 'Testing Labels'
    label.sizeToFit
    label.center = [self.view.frame.size.width / 2, self.view.frame.size.height / 2]
    label
  end
end

