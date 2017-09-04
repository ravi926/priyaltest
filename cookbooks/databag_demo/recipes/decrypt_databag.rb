
secret = Chef::EncryptedDataBagItem.load_secret(Chef::Config[:encrypted_data_bag_secret])
my_encrypted_dbag = Chef::EncryptedDataBagItem.load("admins", "myattributes", secret)


puts "groupname: #{my_encrypted_dbag['groupname']}"
puts "user : #{my_encrypted_dbag['user']}"
puts "password: #{my_encrypted_dbag['password']}"

        user "#{my_encrypted_dbag['user']}" do
                home "/home/#{my_encrypted_dbag['user']}"
                password "#{my_encrypted_dbag['password']}"
        end



=begin

login = data_bag('admins')

        data_value = data_bag_item('admins',val)
        if (val == "myattributes") then
                puts "groupname: #{data_value['groupname']}"
                puts "user : #{data_value['user']}"
                puts "password: #{data_value['password']}"

        user "#{data_value['user']}" do
                home "/home/#{data_value['user']}"
                password "#{data_value['password']}"
        end
=begin
        elsif (val == "webserver" ) then
                puts "application1_ipadress: #{data_value['application1_ipadress']}"
                puts "application1_ipadress: #{data_value['application2_ipadress']}"
                puts "db_1_ipaddress: #{data_value['db_1_ipaddress']}"
=end
#        end
#end

