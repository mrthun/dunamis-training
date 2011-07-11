namespace 'db' do
  desc 'Reload Database'
  task :reload  do
    begin
      Rake::Task["db:drop"].invoke     rescue got_error = true
      Rake::Task["db:create"].invoke   rescue got_error = true
    rescue
      Rake::Task["db:create"].invoke   rescue got_error = true
    end
    Rake::Task["db:migrate"].invoke    rescue got_error = true
    Rake::Task["db:seed"].invoke       rescue got_error = true
  end
end
