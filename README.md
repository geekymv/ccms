#### 开发环境
- [JDK 1.8](https://www.oracle.com/java/technologies/downloads/#java8)
- [Tomcat 8](https://tomcat.apache.org/download-80.cgi)
- [MySQL 5.7](https://dev.mysql.com/downloads/mysql/5.7.html)

#### 生成密码
执行 com/ccms/util/EncryptUtil.java 文件中的 main 方法，得到明文`111111`加密后的密码，比如xyz

#### 添加管理员
```sql
INSERT INTO `ccms`.`t_colleges` ( `id`, `account`, `name`, `pwd`, `phone`, `contact`, `address`, `colType`, `authority` )
VALUES ( 1, 'admin', '管理员', '加密后的密码', NULL, NULL, NULL, 1, 1 );
```
