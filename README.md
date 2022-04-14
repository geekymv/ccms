#### 生成密码
执行 com/ccms/util/EncryptUtil.java 文件中的 main 方法，得到明文`111111`加密后的密码，比如xyz

#### 添加管理员
```sql
INSERT INTO `ccms`.`t_colleges` ( `id`, `account`, `name`, `pwd`, `phone`, `contact`, `address`, `colType`, `authority` )
VALUES ( 1, 'admin', '管理员', '加密后的密码', NULL, NULL, NULL, 1, 1 );
```
