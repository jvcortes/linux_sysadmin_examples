# Configures a nginx custom header


exec { 'set custom header' :
  command  => "sudo sed -i \"47 i \tadd_rule X-Served-By $(hostname)\"\
  /etc/nginx/sites-enabled/default",
  provider => 'shell'
}
