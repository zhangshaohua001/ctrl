<?php
/**
 * 分库分表的自定义数据库路由配置
 * 
 * @author: dogstar <chanzonghuang@gmail.com> 2015-02-09
 */

return array(
    /**
     * DB数据库服务器集群
     */
    'servers' => array(

        'ucheuxing' => array(
            'host'      => 'localhost',             //数据库域名
            'name'      => 'ucheuxing',                  //数据库名字
            'user'      => 'root',                  //数据库用户名
            'password'  => '123456',	            //数据库密码
            'port'      => '3306',		            //数据库端口
        ),

    ),

    /**
     * 自定义路由表
     */
    'tables' => array(
        '__default__' => array(
            'prefix' => 'fd_',
            'key'=>'id',
            'map' => array(
                array('db' => 'ucheuxing'),
            ),
        ),

    ),

);
