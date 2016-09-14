<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-2
 * Time: 下午4:09
 */
 
class Domain_Main extends Domain_CheckLogin{
    //首页初始化
    public function initialize($params){
        $params['page'] = 1;
        //获取用户能量值
        $model_rank = new Model_Rank();
        $energy = $model_rank->getEnergyValueById($params['user_id']);

        //获取闹钟信息
        $model_clock = new Model_Clock();
        $params_clock = array(
            'user_id' => $params['user_id'],
            'count' => $params['count'],
            'page' => $params['page']
        );
        $clock = $model_clock->getInfoNoCompleteByUserId($params_clock);

        //获取能量值建议
        if($energy && $energy['last_value']){
            $model_energy_advice = new Model_EnergyAdvice();
            $energy['advice'] = $model_energy_advice->getAdvice($energy['last_value']);
        }

        $domain_msg = new Domain_Msg();
        $encourage = $domain_msg->_getEncourageMsg($params);

        $this->result['data']['energy'] = $energy ? $energy : array();
        $this->result['data']['clock'] = $clock ? $clock : array();
        $this->result['data']['encourage'] = $encourage ? $encourage : array();
        return $this->result;
    }
}