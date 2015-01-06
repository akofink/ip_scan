#!/usr/bin/env ruby

if `whoami`[/root/]
  unless `ls /usr/local/bin/ip_scan`.empty?
    puts "$ rm -f /usr/local/bin/ip_scan"
    puts `rm -f /usr/local/bin/ip_scan`
    puts "\nSUCCESS!" if `ls /usr/local/bin/ip_scan`.empty?
  end
else
  puts 'This must be run as root.'
end
