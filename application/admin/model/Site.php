<?php
/**
 * Site MOdel
 * User: xianyu
 * Date: 2018/7/10
 * Time: 下午2:06
 */

namespace app\admin\model;

use think\Db;

class Site extends \think\Model {

    /**
     * 根据id获取站点信息
     * @param $id
     * @return array|false|object|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getInfo($id) {
        $res = $this->field('id,name,link,tip,listorder,updatetime,display,sql_ip,sql_user,sql_pass,sql_database,sql_table')
            ->where(array('id' => $id))
            ->find();
        if ($res) {
            $res = $res->data;
        }

        return $res;
    }


}