Pod::Spec.new do |s|

  s.name         = "Validators"
  s.version      = "0.0.1"
  s.summary      = "Validators collection."
  s.homepage     = "https://github.com/elegion/ios-Validators"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "chebur" => "chebur.mail@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/elegion/ios-Validators.git", :tag => s.version }

  s.source_files  = "Source", "Source/**/*.{h,m}"

end
