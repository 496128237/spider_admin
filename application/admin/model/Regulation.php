<?php
/**
 * Site MOdel
 * User: xianyu
 * Date: 2018/7/10
 * Time: 下午2:06
 */

namespace app\admin\model;

use think\Db;

class Regulation extends \think\Model
{

    /**
     * 根据id获取抓取规则信息
     * @param $id
     * @return array|false|object|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getInfo($id)
    {
        $res = $this->field('id,name,tip,reg_list,reg_title,reg_dec,reg_content')
            ->where(array('id' => $id))
            ->find();
        if ($res) {
            $res = $res->data;
        }

        return $res;
    }

    /**
     * 获取所有抓取规则信息
     */
    public function getAllReg()
    {
        $tmp = $this->select();
        if ($tmp) {
            $res=array();
            foreach ($tmp as $v){
                $res[]=$v->data;
            }
        }
        return $res;
    }

}