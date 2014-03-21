# see http://qiita.com/ryurock/items/4b079f89990a13baa712
template "/etc/sysconfig/clock" do
  notifies :run, "execute[timezone_change]", :immediately
  not_if "date | grep JST"
end

execute "timezone_change" do
  command "cp /usr/share/zoneinfo/#{node[:tz]} /etc/localtime"
  action :nothing
end
