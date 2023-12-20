#!/usr/bin/env ruby

puts "Loading methods from #{__FILE__}"

IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = "~/.irb-history"
IRB.conf[:USE_AUTOCOMPLETE] = false

class Object
  def ms
    public_methods - Object.public_methods
  end
end

def rrr
  reload!
end

# ss is short for "show source"
def ss(thing)
  if thing.starts_with?(/[A-Z]/)
    Object.const_source_location(thing)
  else
    method(thing).source_location
  end
end

def current_account
  @current_account ||= Account.find(1) if defined? Account
end

def current_user
  @current_user ||= current_account.users.first if defined? current_account
end
