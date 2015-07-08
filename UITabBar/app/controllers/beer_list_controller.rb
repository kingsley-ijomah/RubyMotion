class BeerListController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle("List", image:UIImage.imageNamed('list.png'), tag:1)
    end
    self
  end

  def viewDidLoad
    super
  end
end
