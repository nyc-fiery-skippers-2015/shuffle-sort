module Parser
  def self.load(file)
    CSV.open(file, mode = "wb", headers: true, header_converters: :symbol, converters: :all).map{|row|Task.new(row)}
  end

  def self.save(file, data)
    CSV.open(file, "wb") do |csv|
      csv << data.first.instance_variables.map!{|variable|variable.to_s.gsub!("@", "")}
      data.each do |object|
        variables = object.instance_variables
        values = []
        variables.each do |variable|
          values << object.instance_variable_get(variable)
        end
        csv <<values
      end
    end
  end
end

