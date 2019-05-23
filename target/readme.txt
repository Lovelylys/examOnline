#######################################################################
#                                                                     #
#                   北京智汇云端科技有限公司                          #
#                                                                     #
#  更多操作说明请参考以下网址：                                       #
#  https://market.aliyun.com/products/53400005/cmjj014493.html        #
#                                                                     #
#######################################################################

请注意： 如需外网远程访问mysql 请参考以上网址 设置mysql及阿里云安全组
 
################################  Tomcat ###############################

安装目录  /www/server/apache-tomcat-default
版本：    apache-tomcat-8.5.32       
监听端口：8080
配置文件： /www/server/apache-tomcat-default/conf/server.xml
命令：     systemctl (start|stop|restart|disable) tomcat
示例：    启动tomcat  systemctl start tomcat
          重启tomcat  systemctl restart tomcat
          禁止tomcat  systemctl disable tomcat

############################### mysql ##################################

安装目录  /usr/local/mysql
版本：    5.7.22
监听端口：3306
配置文件： /etc/my.cnf
数据文件： /usr/local/mysql/data
默认密码： uAiqwVwjJ8-i 
命令：     systemctl (start|stop|restart|disable) mysql
示例：    启动mysql  systemctl start mysql
          重启mysql  systemctl restart mysql
          禁止mysql  systemctl disable mysql

################################ Nginx ##################################

安装目录： /usr/local/nginx/
版本：     nginx/1.14.0
监听端口： 80
配置文件： /etc/nginx/nginx.conf
命令：     systemctl (start|stop|restart|disable) nginx
示例：    启动nginx   systemctl start nginx
          重启nginx   systemctl restart nginx
          禁止nginx   systemctl disable nginx

################################ JDK  ####################################

安装目录  /usr/java/default
版本：    1.8.0_171

