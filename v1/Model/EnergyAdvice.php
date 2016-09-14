<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-3
 * Time: 下午12:05
 */
 
class Model_EnergyAdvice extends PhalApi_Model_NotORM{
    protected function getTableName($id)
    {
        return 'energy_advice';
    }

    /**
     * 根据能量值获取建议
     */
    public function getAdvice($energy_value){
        $data = DI()->notorm->energy_advice->where("min < ? AND max >= ?",$energy_value,$energy_value)->select("content")->fetch();
        return $data['content'];
    }
}