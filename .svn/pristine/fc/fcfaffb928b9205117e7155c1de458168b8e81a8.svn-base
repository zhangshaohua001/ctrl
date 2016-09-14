<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-1
 * Time: 下午12:54
 */
 
class Domain_Clock extends Domain_CheckLogin{
    public $model_clock; //用户模型
    public function __construct()
    {
        parent::__construct();
        $this->model_clock = new Model_Clock();

    }

    /**
     * 闹钟设置
     */
    public function set($params){
        $base_Arr = array(
            'create_time' => time(),
            'update_time' => time()
        );

        //检查相同闹钟设置
        self::checkSameContent($params);

        $insert = array_merge($params,$base_Arr);
        $clock_id = $this->model_clock->insertClock($insert);
        if(!$clock_id){ //写入闹钟信息失败
            $this->result['code'] = Common_Code::DATA_INSERT_ERROR;
            $this->result['msg'] = T('data_insert_error');
            return $this->result;
        }

        $this->result['data']['clock_id'] = intval($clock_id);
        return $this->result;
    }

    /**
     * 获取闹钟信息
     */
    public function get($params){
        $data = $this->model_clock->getInfoById($params['id'],$params['user_id']);

        if(!$data){ //信息不存在
            $this->result['code'] = Common_Code::DATA_NOT_EXIST;
            $this->result['msg'] = T('data_not_exist');
            return $this->result;
        }

        $this->result['data'] = $data;
        return $this->result;
    }

    /**
     * 根据用户id获取所有闹钟信息
     */
    public function getAll($params){
        $data = $this->model_clock->getInfoByUserId($params);

        if(!$data){ //信息不存在
            $this->result['code'] = Common_Code::DATA_NOT_EXIST;
            $this->result['msg'] = T('data_not_exist');
            return $this->result;
        }

        $this->result['data']['list'] = $data;
        return $this->result;
    }

    /**
     * 获取闹钟信息
     */
    public function delete($params){
        $rs = $this->model_clock->deleteById($params['id'],$params['user_id']);

        if(!$rs){ //删除失败
            $this->result['code'] = Common_Code::DATA_DELETE_FAILED;
            $this->result['msg'] = T('data_delete_failed');
            return $this->result;
        }

        $this->result['data']['count'] = $rs;
        return $this->result;
    }

    /**
     * 更新闹钟
     */
    public function update($params){
        //检查相同闹钟设置
        self::checkSameContent($params);

        $user_id = $params['user_id'];
        $id = $params['id'];
        unset($params['user_id'],$params['id']);
        $rs = $this->model_clock->updateById($id,$user_id,$params);

        if($rs === false){ //更新失败
            $this->result['code'] = Common_Code::DATA_UPDATE_FAILED;
            $this->result['msg'] = T('data_update_failed');
            return $this->result;
        }

        $this->result['data']['msg'] = 'success';
        return $this->result;
    }

    /**
     * 设置闹钟完成
     */
    public function complete($params){
        $rs = $this->model_clock->complete($params['id'],$params['user_id'],$this->time);

        if($rs === false){ //更新失败
            $this->result['code'] = Common_Code::DATA_UPDATE_FAILED;
            $this->result['msg'] = T('data_update_failed');
            return $this->result;
        }

        $this->result['data']['msg'] = 'success';
        return $this->result;
    }

    /**
     * 检查相同闹钟设置次数
     */
    private function checkSameContent($params){
        $count = $this->model_clock->checkSameCtn(array('info'=>$params['info']),$params['user_id']);
        if($count >= DI()->config->get('sys.max_same_clock_count')){ //超过最大允许相同闹钟状态
            //禁用帐号
            $model_user = new Model_User();
            $model_user->forbidById($params['user_id']);

            //错误返回
            $this->result['code'] = Common_Code::OVER_MAX_ALLOW_SAME_CONTENT;
            $this->result['msg'] = T('over_max_allow_same_content');
            DI()->response->setData($this->result);
            DI()->response->output();
            exit;
        }
    }


    /**
     * 闹钟分享
     */
    public function share($params){
        $data= $this->model_clock->getShareInfoById($params['clock_id'],$params['user_id']);
        if(!$data){ //信息不存在
            $this->result['code'] = Common_Code::DATA_NOT_EXIST;
            $this->result['msg'] = T('data_not_exist');
            return $this->result;
        }
        $time = date("n月j日 H:m",$data['create_time']);
        $info= "我要在{$time}完成[{$data['info']}]，我正在使用能量时钟哦！";
        $insert = array(
            'user_id' => $params['user_id'],
            'info' => $info,
            'type' => Common_Conf::SHARE_TYPE_CLOCK,
            'create_time' => time()
        );
        $model_share = new Model_Share();
        $share_id = $model_share->insertShare($insert);
        $this->result['data']['share_id'] = $share_id;
//        $this->result['data']['title'] = "【能量时钟】".mb_substr($info,0,15,'utf-8')."...";
        $this->result['data']['title'] = mb_substr($info,0,15,'utf-8')."...";
        $this->result['data']['info'] = $info;
        $this->result['data']['picture'] = "http://serviceapp.aibdai.com/h5/resource/images/logo.png";
        $this->result['data']['url'] = "http://serviceapp.aibdai.com/h5/share_clock.php?id=".urlencode(base64_encode($share_id));
        return $this->result;
    }
}