<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-3
 * Time: 下午12:05
 */
 
class Model_Advice extends PhalApi_Model_NotORM{
    protected function getTableName($id)
    {
        return 'advice';
    }

    /**
     * 插入意见内容
     */
    public function insertMsg($user_id,$msg){
        $params = array("user_id"=>$user_id,"msg"=>$msg,'create_time'=>time());
        $insert = DI()->notorm->advice;
        $insert->insert($params);
        $id = $insert->insert_id();
        return $id;
    }
}