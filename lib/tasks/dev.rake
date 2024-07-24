desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  Injury.delete_all
   
end
