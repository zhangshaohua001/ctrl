<?php

class Model_Energy extends PhalApi_Model_NotORM {
	protected function getTableName($id) {
		return 'energy_day';
	}

	/**
	 * 插入每日能量
	 */
	public function insertTest($params){
		return DI()->notorm->energy_day->insert($params);
	}

	/**
	 * 更新能量测试记录
	 */
	public function updateRank($user_id,$insert,$update){
		return DI()->notorm->energy_rank->insert_update($user_id,$insert,$update);
	}

	/**
	 * 获取当天能量测试时间
	 */
	public function getTestTime($user_id,$date = ''){
		$date = $date ? $date : date('Ymd');
		return DI()->notorm->energy_day->where("user_id = ? AND test_date = ?",$user_id,$date)->order("test_time asc")->select("test_time time")->limit(2)->fetchAll();
	}
}
