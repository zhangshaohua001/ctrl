<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-31
 * Time: 下午3:49
 */
 
class Model_Rank extends PhalApi_Model_NotORM{
    protected function getTableName($id) {
        return 'energy_rank';
    }

    /**
     * 获取测试排名
     */
    public function getTestRank($count){
        return self::_getRank($count,"last_value desc");
    }

    /**
     * 获取总排名
     */
    public function getAllRank($count)
    {
        return self::_getRank($count,"all_value desc");
    }
    public function _getRank($count,$order){
        return DI()->notorm->energy_rank->order($order)->limit($count)->select("user_id,last_value,all_value,test_time,test_count")->fetchAll();
    }

    /**
     * 根据用户id获取用户能量值
     */
    public function getEnergyValueById($user_id){
        return DI()->notorm->energy_rank->where("user_id",$user_id)->select("user_id,last_value,all_value,test_time,test_count")->fetch();
    }

    /**
     * 根据用户能量获取测试排名
     */
    public function getTestRankByEnergy($energy){
        return self::_getRankByEnergy($energy,"last_value");
    }

    /**
     * 根据用户能量获取总排名
     */
    public function getAllRankByEnergy($energy){
        return self::_getRankByEnergy($energy,"all_value");
    }
    public function _getRankByEnergy($energy,$column){
        $rank = DI()->notorm->energy_rank->where("{$column} > ?",$energy)->count("*");
        return $rank + 1;
    }

    //查询多个好友能量
    public function getEnergyValueByMobiles($params){
        $prefix = DI()->config->get('dbs.tables.__default__.prefix'); //表前缀
        $mobile = "(".implode(",",$params['mobile']).")";

        $sql = "SELECT mobile,last_value FROM `{$prefix}user` AS `user` LEFT JOIN {$prefix}energy_rank AS energy_rank ON `energy_rank`.user_id = `user`.id WHERE mobile in {$mobile}";
        $rows = $this->getORM()->queryAll($sql, array());
        return $rows;
    }
}