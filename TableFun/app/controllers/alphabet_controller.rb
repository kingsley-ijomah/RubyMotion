class AlphabetController < UIViewController
  def viewDidLoad
    super
    self.title = 'Alphabet'
    @table = UITableView.alloc.initWithFrame(self.view.bounds) 
    @table.autoresizingMask = UIViewAutoresizingFlexibleHeight 
    @table.dataSource = self #implements tableView
    @table.delegate = self #handles what to do after interacting with table
    @data = {}
    ("A".."Z").to_a.each do |letter|
      @data[letter] = [] 
      5.times do
        random_string = (0...4).map{65.+(rand(25)).chr}.join
        @data[letter] << letter + random_string
      end 
    end

    self.view.addSubview(@table)
  end

  def tableView(tableView, numberOfRowsInSection: section_index) 
    rows_for_section(section_index).count
  end

  def sections
    @data.keys.sort
  end

  def rows_for_section(section_index) 
    @data[self.sections[section_index]]
  end


  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.textLabel.text = row_for_index_path(indexPath)
    cell
  end

  def row_for_index_path(index_path) 
    rows_for_section(index_path.section)[index_path.row]
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    letter = sections[indexPath.section]

    controller = UIViewController.alloc.initWithNibName(nil, bundle:nil)
    controller.view.backgroundColor = UIColor.whiteColor
    controller.title = letter

    label = UILabel.alloc.initWithFrame(CGRectZero)
    label.text = row_for_index_path(indexPath)
    label.sizeToFit
    label.center = [controller.view.frame.size.width / 2,
                    controller.view.frame.size.height / 2]
    controller.view.addSubview(label)
    self.navigationController.pushViewController(controller, animated:true)
  end
  
  def numberOfSectionsInTableView(tableView) 
    self.sections.count
  end

  def tableView(tableView, titleForHeaderInSection:section) 
    sections[section]
  end
end










