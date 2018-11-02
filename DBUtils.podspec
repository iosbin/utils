
Pod::Spec.new do |s|

  s.name         = "DBUtils"
  s.version      = "0.0.1"
  s.summary      = "A short description of Utils."
  s.description  = "test"
  s.homepage     = "https://github.com/iosbin/Utils"
  s.license      = "MIT"
  s.author             = { "董彬" => "jixiedongbin@163.com" }
  s.source       = { :git => "https://github.com/iosbin/Utils.git", :tag => "#{s.version}" }
  s.platform	 = :ios, "9.0"
  s.source_files  = "Utils", "Utils/**/*.{h,m}"
  s.exclude_files = "Utils/Exclude"

end
