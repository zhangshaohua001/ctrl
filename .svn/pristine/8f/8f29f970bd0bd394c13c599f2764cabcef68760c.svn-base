<?php

class Domain_User extends Domain_Base{
    public $model_user; //用户模型
    public function __construct()
    {
        parent::__construct();
        $this->model_user = new Model_User();
    }

    /**
     * 手机号登录
     */
    public function login($param){
        $account = $param['mobile'];
        if(!$this->checkAccountFormat($account)){ //帐号格式错误
            $this->result['code']=Common_Code::ACCOUNT_FORMAT_WRONG;
            $this->result['msg']=T('account_format_wrong');
            return  $this->result;
        }

        $user_id = $this->checkAccount($account); //检查帐号是否存在
        if(!$user_id){
            //帐号不存在写入帐号信息
            $param_insert = array(
                'mobile' => $account
            );
            $user_id['id'] = $this->model_user->insertUser($param_insert); //写入用户信息
            if(!$user_id){ //写入失败
                $this->result['code'] = Common_Code::DATA_INSERT_ERROR;
                $this->result['msg'] = T('data_insert_error');
                return $this->result;
            }
        }

        //生成登录信息
        $rs = $this->loginHandle($user_id['id']);
        $this->result['data'] = $rs;
        return $this->result;
    }

    /**
     * 检查帐号是否存在
     */
    public function checkAccount($account){
        $rs = $this->model_user->checkAccount($account);
        return $rs;
    }

    /**
     * 检查帐号格式是否正确
     */
    public function checkAccountFormat($account){
        if(!preg_match(DI()->config->get('sys.preg_mobile'),$account)){
            return false;
        }
        return true;
    }

    /**
     * 第三方登录
     */
    public function loginOrg($param){
        //检查帐号是否存在
        $user_id = $this->checkAccountOrg($param['login_type'],$param['access_token']);
        if(!$user_id){ //如果帐号不存在，写入帐号
            $user_id = $this->model_user->insertUserOrg($param);
        }

        //生成登录信息
        $rs = $this->loginHandle($user_id);
        $this->result['data'] = $rs;
        return $this->result;
    }

    /**
     * 检查第三方帐号是否存在
     */
    public function checkAccountOrg($login_type,$access_token){
        $rs = $this->model_user->checkAccountOrg($login_type,$access_token);
        return $rs ? $rs['user_id'] : false;
    }

    /**
     * 生成用户登录信息
     */
    public function loginHandle($user_id){
        //用户是否被禁用
        if(!$this->model_user->checkStatus($user_id)){
            //错误返回
            $this->result['code'] = Common_Code::USER_FORBID_LOGIN;
            $this->result['msg'] = T('user_forbid_login');
            DI()->response->setData($this->result);
            DI()->response->output();
            exit;
        }

        //获取用户登录信息
        $login_info = $this->model_user->getUserLoginInfo($user_id);
        $nickname = $this->model_user->getNicknameById($user_id);
        //生成唯一认证id
        $auth_id = uniqid('sess_');

        //写入此次登录信息
        $param_insert = array(
            'last_login_time' => $this->time,
            'last_login_ip' => Common_Func::getIP(),
            'login_count' => intval($login_info['login_count']) + 1,
            'login_type' => Common_Func::getLoginType(),
            'login_session' => $auth_id
        );
        $this->model_user->updateUserLoginInfo($user_id,$param_insert);
        $rs = array(
            'user_id' => intval($user_id),
            'nickname' => $nickname,
            'last_login_time' => intval($login_info['last_login_time']),
            'last_login_ip' => $login_info['last_login_ip'],
            'login_count' => intval($login_info['login_count']) + 1,
            'login_type' => intval($login_info['login_type']),
            'login_token' => $auth_id,
        );
        return $rs;
    }

    /**
     * 获取用户信息
     */
    public function info($params){
        $user_id = $params['user_id'];

        //检查用户登录状态
        Common_Func::checkUserLogin();

        $model_energy = new Model_Energy();
        $model_rank = new Model_Rank();

        $model_config = new Model_Config();
        //获取用户信息
        $nickname = $this->model_user->getNicknameById($user_id);
        $test_time = $model_config->getTestTime($user_id);
        $energy = $model_rank->getEnergyValueById($user_id);
        $test_rank = $model_rank->_getRankByEnergy($energy['last_value'],"last_value");
        $all_rank = $model_rank->_getRankByEnergy($energy['all_value'],"all_value");
        unset($energy['user_id']);
        $this->result['data']['user_id'] = $user_id;
        $this->result['data']['nickname'] = $nickname;
        $this->result['data']['test_time_list'] = $test_time ? $test_time : array();
        $this->result['data']['energy'] = $energy ? $energy : array();
        $this->result['data']['rank']['test'] = $energy ? $test_rank : 0;
        $this->result['data']['rank']['all'] = $energy ? $all_rank : 0;
        return $this->result;
    }

    /**
     * 退出登录
     */
    public function logout($params){
        if(!Common_Func::checkUserLoginStatus($params['user_id'],$params['login_session'])){ //用户未登录
            $this->result['code'] = Common_Code::USER_HAVE_LOGOUT;
            $this->result['msg'] = T("user_have_logout");
            return $this->result;
        }

        $this->model_user->clearLoginSession($params['user_id']);
        $this->result['data']['msg'] = 'success';
        return $this->result;
    }








    /**
     * 设置密码
     */
    public function setPassword($param){
        //检查用户是否登录
        if(!Common_Func::checkUserLoginStatus($param['user_id'],$param['session_id'])){ //未登录
            $this->result['code'] = Common_Code::LOGIN_NOT;
            $this->result['msg'] = T('user_not_login');
            return $this->result;
        }

        //检查密码是否为空 , 不空返回错误
        var_dump($this->model_user->checkPasswordEmpty($param['user_id']));
        if($this->model_user->checkPasswordEmpty($param['user_id'])){
            $this->result['code'] = Common_Code::PASSWORD_HAVE_SET;
            $this->result['msg'] = T('password_not_empty');
            return $this->result;
        }




    }
}
