Pod::Spec.new do |s|
  s.name             = 'JF3DTouchButton'
  s.version          = '0.0.6'
  s.summary          = 'JF3DTouchButton is a touch sensitive button built for 3D touch compatible devices.'
  s.description      = <<-DESC
                       JF3DTouchButton is a touch sensitive button built for 3D touch compatible devices. It provides additional state properties and transitional features to improve a user\'s 3D touch experience.
                       DESC
  s.homepage         = 'https://github.com/jfuellert/JF3DTouchButton'
  s.license          = { :type => 'None', :file => 'LICENSE' }
  s.author           = { 'jfuellert' => 'jfuellert@gmail.com' }
  s.source           = { :git => 'https://github.com/jfuellert/JF3DTouchButton.git', :tag => s.version }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
	
  s.source_files     = 'JF3DTouchButton/JF3DTouchButton/**/*.{h,m}'
  s.public_header_files = 'JF3DTouchButton/JF3DTouchButton/JF3DTouchButton.h'

  s.frameworks          = 'UIKit'
end