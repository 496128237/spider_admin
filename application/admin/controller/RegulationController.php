<?php
/**
 * 规则管理类
 * User: xianyu
 * Date: 2018/7/10
 * Time: 上午11:54
 */

namespace app\admin\controller;

use think\Loader;

class RegulationController extends CommonController
{
    public function index()
    {
        $where = array();

        $lists = db('regulation')->paginate(10);
        // 获取分页显示
        $page = $lists->render();

        $this->assign('lists', $lists);
        $this->assign('page', $page);

        return $this->fetch();
    }

    public function info()
    {
        $id = input('id');
        if ($id) {
            //当前规则信息
            $info = model('regulation')->getInfo($id);
            $this->assign('info', $info);
        }
        return $this->fetch();
    }

    /**
     * 添加规则
     */
    public function add()
    {
        $data = input();

        $res = model('regulation')->allowField(true)->save($data);

        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /**
     * 编辑规则
     */
    public function edit()
    {
        $data = input();

        $res = db('regulation')->data($data)->update();

        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /**
     * 删除站点
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        $id = input('id');
        $res = db('regulation')->where(['id' => $id])->delete();
        if ($res) {
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

}