class TodosController < UIViewController
  attr_writer :data

  def viewDidLoad
    super

    self.title = "My Todos"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)

    @todos = Todo.all

    @table.dataSource = self
    @table.delegate = self
    self.view.addSubview(@table)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @todos.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:nil)
    cell.textLabel.text = @todos[indexPath.row].name
    cell
  end

end
