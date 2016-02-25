Pod::Spec.new do |s|

  s.name         = "Validators"
  s.version      = "0.0.1"
  s.summary      = "A short description of Validators."
  s.description  = <<-DESC
                   DESC
  s.homepage     = "https://github.com/elegion/ios-Validators"
  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "chebur" => "chebur.mail@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/elegion/ios-Validators", :tag => "0.0.1" }

  s.source_files  = "Source", "Source/**/*.{h,m}"

end
