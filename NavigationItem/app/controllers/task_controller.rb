class TaskController < UIViewController

  def viewWillAppear(animated)
    self.view.backgroundColor = UIColor.whiteColor
    navigationItem.title = "My Task List"
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'testMe')
  end

  def testMe
    puts 'I was clicked'
  end
end
