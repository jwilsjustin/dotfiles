puts "Loading methods from #{__FILE__}"

class Object
  def ms
    public_methods - Object.public_methods
  end
end

def rrr
  reload!
end

def where(feature)
  globs = $LOAD_PATH.map do |base_dir|
    File.expand_path("#{feature}.*", base_dir)
  end
  files = Dir.glob(globs)
  files.first
end
