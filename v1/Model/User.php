<?php

class Model_User extends PhalApi_Model_NotORM {
	protected function getTableName($id) {
		return 'user';
	}

	/**
	 * 查询手机号帐号是否存在
	 */
	public function checkAccount($account_mobile){
		return DI()->notorm->user->select('id')->where('mobile',$account_mobile)->fetch();
	}

	/**
	 * 检查第三方帐号是否存在
	 */
	public function checkAccountOrg($login_type,$access_token){
		return DI()->notorm->user_org->where("org_type = ? AND access_token = ?",$login_type,$access_token)->select("user_id")->fetch();
	}

	/**
	 * 插入新用户
	 */
	public function insertUser($param){
		$base_arr = array(
			'status' => 1,
			'create_time' => time(),
			'update_time' => time()
		);
		$param = array_merge($param,$base_arr);
		$insert = DI()->notorm->user;
		$insert->insert($param);
		$user_id = $insert->insert_id();

		//将手机号为默认昵称插入user_info表
		$user_info = array(
			'user_id' => $user_id,
			'nickname' => $param['mobile'],
		);
		DI()->notorm->user_info->insert($user_info);
		return $user_id;
	}

	/**
	 * 插入新的第三方用户
	 */
	public function insertUserOrg($param){
		//插入信息到user表
		$user = array(
			'status' => 1,
			'create_time' => time(),
			'update_time' => time()
		);
		$insert = DI()->notorm->user;
		$insert->insert($user);
		$user_id = $insert->insert_id();

		//插入昵称到user_info表
		$user_info = array(
			'user_id' => $user_id,
			'nickname' => $param['nickname'],
		);
		DI()->notorm->user_info->insert($user_info);
		//插入信息到user_org表
		$user_org = array(
			'user_id' => $user_id,
			'org_type' => $param['login_type'],
			'access_token' => $param['access_token']
		);
		DI()->notorm->user_org->insert($user_org);
		return $user_id;
	}

	/**
	 * 获取用户登录信息
	 */
	public function getUserLoginInfo($user_id){
		return DI()->notorm->user->select('last_login_time,last_login_ip,login_count,login_type,login_session')->where('id',$user_id)->fetch();
	}

	/**
	 * 根据id获取用户昵称
	 */
	public function getNicknameById($user_id){
		$nickname = DI()->notorm->user_info->select('nickname')->where('user_id',$user_id)->fetch();
		return $nickname['nickname'];
	}

	/**
	 * 更新用户登录信息
	 */
	public function updateUserLoginInfo($user_id,$param){
		return DI()->notorm->user->where('id',$user_id)->update($param);
	}

	/**
	 * 检查用户登录状态
	 */
	public function getUserLoginSession($user_id){
		return DI()->notorm->user->where('id',$user_id)->select('login_session')->fetch();
	}

	/**
	 * 更新用户密码
	 */
	public function updatePassword($user_id,$password){
		return DI()->notorm->user->where('id',$user_id)->update(array('password'=>$password));
	}

	/**
	 * 检查密码是否为空
	 */
	public function checkPasswordEmpty($user_id){
		$password = DI()->notorm->user->where('id',$user_id)->select('password')->fetch();
		return empty($password) ? true: false;
	}

	/**
	 * 清空login_session
	 */
	public function clearLoginSession($user_id){
		return DI()->notorm->user->where('id',$user_id)->update(array("login_session"=>""));
	}

	/**
	 * 根据手机号查询用户id
	 */
	public function getUserIdByMobile($mobile){
		return DI()->notorm->user->where("mobile",$mobile)->fetch("id");
	}

	/**
	 * 禁用用户帐号
	 */
	public function forbidById($user_id){
		return DI()->notorm->user->where("id",$user_id)->update(array('login_session' => '','status' => 0));
	}

	/**
	 * 检查用户帐号是否被禁用
	 */
	public function checkStatus($user_id){
		return DI()->notorm->user->where("id",$user_id)->fetch("status");
	}
}
