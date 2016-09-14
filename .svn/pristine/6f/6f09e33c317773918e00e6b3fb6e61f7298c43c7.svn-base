<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-1
 * Time: 下午12:57
 */
 
class Model_Share extends PhalApi_Model_NotORM{
    protected function getTableName($id)
    {
        return 'share';
    }

    /**
     * 添加闹钟
     */
    public function insertShare($params){
        $insert = DI()->notorm->share;
        $insert->insert($params);
        $insert_id = $insert->insert_id();
        return $insert_id;
    }
}