class Rule

  attr_reader   :title, :description

  def initialize(attrs = {})
    @title = attrs[:short_name]
    @desciption = attrs[:description]
  end
end