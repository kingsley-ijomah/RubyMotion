class FlowerController < UIViewController
  def viewDidLoad
    super
    self.title = 'Flower'
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Colors", image: nil, tag: 1)
    self
  end

end
