class Todo
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter

  columns name: :string, 
    details: :string, 
    due_date: { type: :date, formation: { picker_type: :date_time }},
    done: { type: :boolean, default: false, formation: { type: :switch }}

  validates :name, presence: true

  def overdue?
    NSDate.now  > self.due_date && !done
  end
end
