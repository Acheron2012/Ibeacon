# Ibeacon
开发目标：实现对IBeacon设备的管理及服务提供 

系统功能
建立IBeacon业务管理网站，提供类似博客网站形式的网页服务，用户可以在其上发布对应IBeacon设备的内容信息，包括文字、图片、声音及视频等
使用支持BLE4.0 的手机扫描到周围的IBeacon设备后，向服务器发出请求，服务器返回对应的IBeacon设备UUID、Major、Minor信息的网页
系统能够支持多级用户管理，分为系统管理员、运营商管理员及终端用户管理员，系统管理员可以管理所有用户、设备及页面、运营商管理员可以管理自己及所属终端用户的设备和页面，终端用户进管理自己的设备和页面
对IBeacon设备的管理里主要为生成、查询和设置用户的UUID、Major、Minor信息以及对应的内容页面，UUID、Major、Minor的组合信息应具有唯一性
可以根据用户提供的UUID、Major、Minor信息，添加到管理页面中
各级用户均可在自己权限内发布对应IBeacon设备的页面信息
开发环境
JSP服务器：tomcat8.x
Java版本：jdk1.8
开发工具：IntelliJ idea或eclipse
项目管理：Maven3.x
版本控制：github
