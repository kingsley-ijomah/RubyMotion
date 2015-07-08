class TodosController < UIViewController
  attr_writer :data

  def viewDidLoad
    super

    self.title = "My Todos"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)

    @data = %w(Milk Orange\ Juice Apples Bananas Brocolli Carrots Beef Chicken Enchilados Hot\ Dogs Butter Bread Pasta Rice)
      .map { |item| "Buy #{item}" }

    @table.dataSource = self
    self.view.addSubview(@table)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @data.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:nil)
    cell.textLabel.text = @data[indexPath.row]
    cell
  end

end
