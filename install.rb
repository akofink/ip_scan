#!/usr/bin/env ruby

if `whoami`[/root/]
  if `ls /usr/local/bin/ip_scan`.empty?
    if `ls /usr/local/bin`.empty?
      puts "$ mkdir -p /usr/local/bin"
      puts `mkdir -p /usr/local/bin`
    end
    puts "$ ln -s #{File.expand_path('ip_scan.rb')} /usr/local/bin/ip_scan"
    puts `ln -s #{File.expand_path('ip_scan.rb')} /usr/local/bin/ip_scan`
    puts "SUCCESS!" unless `ls /usr/local/bin/ip_scan`.empty?
  end
else
  puts 'This must be run as root.'
end
