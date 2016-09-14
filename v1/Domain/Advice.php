<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-3
 * Time: 下午12:03
 */

class Domain_Advice extends Domain_CheckLogin{
    public $model_advice; //用户模型
    public function __construct()
    {
        parent::__construct();
        $this->model_advice = new Model_Advice();
    }

    public function submit($params){
        //写入信息
        $id = $this->model_advice->insertMsg($params['user_id'],$params['msg']);
        $this->result['data']['advice_id'] = $id;
        return $this->result;
    }
}