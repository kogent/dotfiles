# EC2 tools
begin
  require "AWS"
  def connect_to_ec2(aws_key_id, aws_secret, account = "default")
    @ec2 = EC2::Base.new(access_key_id: aws_key_id, secret_access_key: aws_secret)
    puts "connected to EC2 on ".green + account.to_s.red.underline + " account, @ec2 is now active".green
    puts "use something like: "
    puts "@ec2.describe_instances.reservationSet.item.each {|r| r.instancesSet.item.each {|i| puts i.dnsName}}".green.underline
    puts "to return a list of instances"
  end
rescue LoadError
  puts "AWS gem not installed"
end
