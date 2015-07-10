class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    seed unless RUBYMOTION_ENV == 'test'

    todosController = TodosController.alloc.init
    todosController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(todosController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end

  def seed
    if Todo.all.empty?
      now = NSDate.new
      things = %w(Milk Orange\ Juice Apples Bananas Brocolli Carrots Beef Chicken Enchiladas Hot\ Dogs Butter Bread Pasta Rice)
      things.each do |thing|
        Todo.create name: "Buy #{thing}",
          description: "We need #{thing}",
          due_date: now
      end
    end
  end
end
