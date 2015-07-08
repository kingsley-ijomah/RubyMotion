class TodosController < UIViewController
  attr_writer :data

  def viewDidLoad
    super

    self.title = "My Todos"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview(@table)

    @table.dataSource = TodosDataSource.new
    
    @data = %w(Milk Orange\ Juice Apples Bananas Brocolli Carrots Beef Chicken Enchilados Hot\ Dogs Butter Bread Pasta Rice)
      .map { |item| "Buy #{item}" }
  end
end
