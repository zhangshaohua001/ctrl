<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-31
 * Time: 下午3:48
 */
 
 class Domain_Rank extends Domain_CheckLogin{
     public $model_rank; //用户模型
     public function __construct()
     {
         parent::__construct();
         $this->model_rank = new Model_Rank();
     }

     /**
      * 获取测试排名
      */
     public function test($params){
         return self::_rank($params,"last_value");
     }

     /**
      * 获取总排名
      */
     public function all($params){
         return self::_rank($params,"all_value");
     }

     private function _rank($params,$column){
         $count = $params['count'] > 20 ? 20 : $params['count'];
         $this->result['data']['list'] = $this->model_rank->_getRank($count,"{$column} desc");
         $energy = $this->model_rank->getEnergyValueById($params['user_id']);

         $rank = $energy['user_id'] ? $this->model_rank->_getRankByEnergy($energy[$column],$column) : 0;

         $this->result['data']['rank'] = array(
             'user_id' => $energy['user_id'],
             'last_value' =>$energy['last_value'],
             'all_value' =>$energy['all_value'],
             'test_time' =>$energy['test_time'],
             'test_count' =>$energy['test_count'],
             'rank' => $rank
         );

         return $this->result;
     }
 }