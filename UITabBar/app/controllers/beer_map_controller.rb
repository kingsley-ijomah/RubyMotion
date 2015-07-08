class BeerMapController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle("Map", image:UIImage.imageNamed('map.png'), tag:1)
    end
    self
  end

  def viewDidLoad
    super
  end
end
