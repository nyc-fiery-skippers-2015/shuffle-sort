require 'csv'

module Parser
  def self.load(file)
    CSV.open(file, headers: true, header_converters: :symbol, converters: :all).map{|row|Card.new(row)}
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

