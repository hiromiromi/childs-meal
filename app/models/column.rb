class Column < ApplicationRecord

  def index
    @columns = Column.all
  end
end
