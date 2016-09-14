<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-4
 * Time: 上午9:39
 */
 
class Model_Config extends PhalApi_Model_NotORM{
    protected function getTableName($id)
    {
        return 'config';
    }

    /**
     * 设置测试时间
     */
    public function setTestConfig($params){
        $id = $params['user_id'];
        $insert = $params;
        unset($params['user_id']);
        $update = $params;

        $config = DI()->notorm->config;
        $query = $config->where("user_id",$id)->count("*");
        if($query){ //存在数据更新
            $config->where("user_id",$id)->update($update);
        } else { //不存在插入
            $config->insert($insert);
        }
        return ;
    }

    /**
     * 获取测试时间
     */
    public function getTestTime($user_id){
        return DI()->notorm->config->where("user_id",$user_id)->select("test_time1 time1,test_time2 time2")->fetch();
    }
}