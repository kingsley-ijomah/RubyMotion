class FormController < Formotion::FormController
  include BubbleWrap::KVO

  attr_accessor :todo
  attr_accessor :form

  def initialize(todo, table)
    self.form = Formotion::Form.new(todo.to_formotion('Edit your ToDo'))
    self.initWithForm(self.form)
    self.todo = todo
    @table = table
  end

  def viewDidLoad
    super
    saveButton = UIBarButtonItem.alloc.initWithTitle("Save",
                                                     style: UIBarButtonItemStyleBordered,
                                                     target:self, action:'save')
    self.navigationItem.rightBarButtonItem = saveButton

    NSNotificationCenter.defaultCenter.addObserver(
      self,
      selector: 'todoChanged:',
      name: 'MotionModelDataDidChangeNotification',
      object: nil
    )
  end

  def todoChanged(notification)
    case notification.userInfo[:action]
      when 'add'
      when 'update'
        todo = notification.object
        row = todo.id - 1
        path = NSIndexPath.indexPathForRow(row, inSection:0)
        @table.reloadRowsAtIndexPaths([path], withRowAnimation:UITableViewRowAnimationAutomatic)
      when 'delete' 
    end
  end

  def save
    data = @form.render
    @todo.from_formotion!(data)
    @todo.save

    # app = UIApplication.sharedApplication
    # delegate = app.delegate
    # controller = delegate.instance_variable_get("@todos_controller")
    # view = controller.instance_variable_get("@table")
    # view.setNeedsDisplay

    self.navigationController.popToRootViewControllerAnimated(true)
  end
end
