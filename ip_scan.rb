#!/usr/bin/env ruby

require 'ipaddr'

@args = ARGV.join(";")
@start = IPAddr.new(@args[/-s ?(\d+\.?)+/].to_s[/(\d+\.?)+/].to_s)
@end = IPAddr.new(@args[/-e ?(\d+\.?)+/].to_s[/(\d+\.?)+/].to_s)
@valid_addresses = []
@threads = []

if @start && @end && @start.to_i < @end.to_i
  puts "Scanning addresses from #{@start} to #{@end}."

  @threads << Thread.start do
    loop do
      unless @threads.last == @threads.first
        @threads.last.join
        @threads.delete_at(-1)
      end
    end
  end

  (@start..@end).each do |address|
    @threads << Thread.start do
      unless `ping -ot1 #{address.to_s} 2> /dev/null`[/(timeout|no route to host|Host is down|100.0% packet loss)/]
        @valid_addresses << address
      end
    end
  end

  until @threads.first == @threads.last do end
  @threads.first.kill

  puts "Valid addresses"
  puts @valid_addresses.map(&:to_s).join("\n")
else
  puts "Something went wrong."
  puts "args: #{@args}"
  puts "start: #{@start}"
  puts "end: #{@end}"
  puts "valid_addresses: #{@valid_addresses.inspect}"
end
