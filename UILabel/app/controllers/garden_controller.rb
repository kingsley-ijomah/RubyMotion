class GardenController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.blackColor
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Garden", image: nil, tag: 1)
    self.title = "Garden"
    self
  end
end

