<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-4
 * Time: 上午9:55
 */
 
class Domain_Config extends Domain_CheckLogin{
    public $model_config; //用户模型
    public function __construct()
    {
        parent::__construct();
        $this->model_config = new Model_Config();
    }

    /**
     * 设置测试时间
     */
    public function setTestTime($params){
        if($params['test_time1'] == $params['test_time2']){
            $this->result['code'] = Common_Code::TEST_TIME_CAN_NOT_LIKE;
            $this->result['msg'] = T('test_time_can_not_like');
            return $this->result;
        }

        if($this->model_config->setTestConfig($params) !== false){
            $this->result['data']['msg'] = 'success';
        } else {
            $this->result['code'] = Common_Code::DATA_UPDATE_FAILED;
            $this->result['msg'] = T('data_update_failed');
        }
        return $this->result;
    }
}