require 'json'
require 'zip'
require 'fileutils'

class DownloadController < ActionController::Base
  include CodeBuildHelper

  def download
    # generate manifest.json
    FileUtils.mkdir_p(Dir.pwd + "/tmp/my_app/") unless File.exist?(Dir.pwd + "/tmp/my_app/")

    File.open(Dir.pwd  + "/tmp/my_app/manifest.json", "w") do |f|
      f.write(format(CodeSnippets::Manifest.to_json, location: params['location']))
    end
    # generate README.md
    File.open(Dir.pwd  +  "/tmp/my_app/README.md", "w") do |f|
      f.write CodeSnippets::Readme
    end

    # ****BUILD APP FOLDER******
    FileUtils.mkdir_p(Dir.pwd + "/tmp/my_app/app/") unless File.exist?(Dir.pwd + "/tmp/my_app/app")
    # generate template.html
    File.open(Dir.pwd  + "/tmp/my_app/app/template.html", "w") do |f|
      f.write CodeSnippets::Template
    end

    # generate style.css
    File.open(Dir.pwd  +  "/tmp/my_app/app/style.css", "w") do |f|
      f.write format(CodeSnippets::Style, logo: params['logo'])
    end

    # generate app.js
    File.open(Dir.pwd  +  "/tmp/my_app/app/app.js", "w") do |f|
      f.write generate_code(params)
    end

    # *****BUILD CONFIG FOLDER*****
    FileUtils.mkdir_p(Dir.pwd + "/tmp/my_app/config/") unless File.exist?(Dir.pwd + "/tmp/my_app/config")
    #generate config file
    File.open(Dir.pwd  +  "/tmp/my_app/config/iparam_test_json.json", "w") do |f|
      f.write ""
    end
    File.open(Dir.pwd  +  "/tmp/my_app/config/iparams.json", "w") do |f|
      f.write ""
    end

    temp_file = Tempfile.new("my_app.zip")   
    write_to_zip_file(temp_file.path) 

    render :file => temp_file.path, :content_type => 'application/zip', :status => :ok
  end


  def write_to_zip_file(zip_file_path)
    Zip::File.open(zip_file_path, Zip::File::CREATE) do |zipfile|
      file_list = Dir.glob(dir_path.to_s + '/*')
      file_list.each do |file|
        zipfile.add(File.basename(file), file)
      end
    end
    zip_file_path
  end

  def dir_path
    Dir.pwd + "/tmp/my_app/"
  end

  # Zip::File.open("/var/folders/k3/g4dc5r7s0xv7bj1r_9kvlhw08dwjnh/T/my_app.zip20191128-99099-12fh5lk") do |zipfile|
  #   zipfile.each do |entry|
  #     if entry.directory?
  #       puts "#{entry.name} is a folder!"
  #     elsif entry.file?
  #       puts "#{entry.name} is a regular file!"
  #     end
  #   end
  # end
end
