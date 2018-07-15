<?php
/**
 * 站点抓取
 * User: xianyu
 * Date: 2018/7/10
 * Time: 下午3:50
 */

namespace app\admin\controller;
use think\db;

class SpiderController extends CommonController{

    public $id;//站点id
    public $classid;//classid
    public $site_db;//站点数据库
    public $tables;//入库表

    public function __construct(\think\Request $request = null)
    {
        parent::__construct($request);
        //引入Snoopy类库
        import('Snoopy.Snoopy', EXTEND_PATH,'.class.php');

        $this->id=input('id');
        $this->classid=input('spider_classid');
        //根据站点id获取站点数据库配置
        $tb=model('site')->getInfo($this->id);
        $dbconfig=$this->GetDbConfig($tb);

        $this->tables=$tb['sql_table'];

        //链接数据库
        $this->site_db=Db::connect($dbconfig);

    }

    public function info(){
        if ($this->id) {
            //根据站点id获取站点信息
            $info = model('site')->getInfo($this->id);
            //获取所有规则信息
            $reginfo=model('regulation')->getAllReg();

            $this->assign('reginfo',$reginfo);
            $this->assign('info',$info);
        }else{
            $this->error('非法操作');
        }

        return $this->fetch();
    }

    /**
     * 采集列表页
     */
    public function edit(){
        $spider_rex=input('spider_rex');//采集规则
        $spider_url=input('spider_url');//采集地址
        $spider_num=input('spider_num');//采集数量

        //验证字段
        if (empty($spider_rex)){
            $this->error('请选择采集规则');
        }
        if (empty($spider_url)){
            $this->error('请填写采集地址');
        }
        if (empty($spider_num)){
            $this->error('请填写采集数量');
        }

        if ($spider_rex == 7) {
            $this->collection_knowledge($spider_rex, $spider_url, $spider_num);
            die;
        }

        if ($this->id){
            $snoopy=new \Snoopy();
            $snoopy->fetchlinks($spider_url);
            $data=$snoopy->results;
//            print_r($data);die;
            $data=implode(',',$data);
//            echo($data);die;


            //根据抓取规则id获取抓取规则
            $reg=model('regulation')->getInfo($spider_rex);

            //匹配所有列表链接
            $links=$this->match_list($data,$reg['reg_list']);
            $links = array_unique($links);//去除数组重复值
            $links = array_values($links);//重置索引
//            dump($links);die;

            //获取入库其他数据
            $other_data=$this->GetOtherData();

            //循环采集数量
            $data=array();
            for ($i=0;$i<$spider_num;$i++){
                /*$pattern_title='/<h1 class="title">(.*)<\/h1>/';
                $pattern_dec='/<div class="intro">\s+ <p class="sub">\s+<strong>.*<\/strong>(.*)\s+<\/p>\s+<\/div>/isU';
                $pattern_content='/<div class="detail newsContentDetail">\s+(.*)\s+<\/div>/isU';*/

                //抓取详情页内容
                $content=$this->GetNewsContent($links[$i],$reg['reg_title'],$reg['reg_dec'],$reg['reg_content']);
                $content['classid']=$other_data['id'];
                $content['parentid']=$other_data['parentid'];
                $content['parentstr']=$other_data['parentstr'];
                $content['orderid']=$other_data['max_orderid']+$i+1;
                //格式化入库数据
                $data[]=$this->FormatData($content);
            }
//            dump($data);die;
            //入库
            $status=$this->site_db->table($this->tables)->insertAll($data);
            $this->success('成功抓取'.$status.'条数据','site/index');
        }else{
            $this->error('非法操作');
        }
    }

    /**
     * 采集收藏知识列表页
     * $spider_rex      采集规则
     * $spider_url      采集地址
     * $spider_num      采集数量
     */
    public function collection_knowledge($spider_rex, $spider_url, $spider_num)
    {
        $snoopy = new \Snoopy();
        $snoopy->fetch($spider_url);
        $data = $snoopy->results;
        $link_rex = '/<div class="new_cottent">\s+.*\s+<\/div>/isU';
        preg_match_all($link_rex, $data, $con);
        preg_match_all('/<a .*?>.*?<\/a>/', $con[0][0], $arr);
        foreach ($arr[0] as $item) {
            preg_match_all('/href=\'([^\']+)/', $item, $href);
            $links[] = 'http://www.cnarts.net/CWEB/Appreciation_collection/index_read.asp' . $href[1][0];
        }
        //根据抓取规则id获取抓取规则
        $reg = model('regulation')->getInfo($spider_rex);
        //获取入库其他数据
        $other_data = $this->GetOtherData();
        //循环采集数量
        $data = array();
        for ($i = 0; $i < $spider_num; $i++) {
            //抓取详情页内容
            $content = $this->GetNewsContent($links[$i], $reg['reg_title'], $reg['reg_dec'], $reg['reg_content']);
            $content['classid'] = $other_data['id'];
            $content['parentid'] = $other_data['parentid'];
            $content['parentstr'] = $other_data['parentstr'];
            $content['orderid'] = $other_data['max_orderid'] + $i + 1;

            $content['content'] = preg_replace('/(<img.+?src=")(.*?)/i', '$1http://www.cnarts.net$2', $content['content']);

            //格式化入库数据
            $data[] = $this->FormatData($content);
        }
//        dump($data);die;
        //入库
        $status = $this->site_db->table($this->tables)->insertAll($data);
        $this->success('成功抓取' . $status . '条数据', 'site/index');
    }

    /**
     * 采集单条数据
     */
    public function one()
    {
        return $this->fetch();
    }

    /**
     * 正则匹配新闻列表中的所有li
     * @param $data
     * @param $reg_list 匹配列表规则
     * @return mixed
     */
    private function match_list($data,$reg_list){
        preg_match_all($reg_list,$data,$arr);
        return $arr[0];
    }

    /**
     * 正则匹配新闻详情页content
     * @param $url  新闻详情link
     * @param $pattern_title  新闻详情正则匹配规则(新闻标题)
     * @param $pattern_dec  新闻详情正则匹配规则(新闻摘要)
     * @param $pattern_content  新闻详情正则匹配规则(新闻内容)
     */
    private function GetNewsContent($url,$pattern_title,$pattern_dec,$pattern_content){
        $snoopy=new \Snoopy();
        $snoopy->fetch($url);
        $content=$snoopy->results;
        $host = parse_url($url);
        //匹配新闻标题
        preg_match($pattern_title,$content,$tit);
//        dump($tit);die;
        //匹配摘要
        preg_match_all($pattern_dec,$content,$dec);
//        dump($dec);die;
        //匹配新闻内容
        preg_match_all($pattern_content,$content,$con);
//        dump($con);die;

        $arr['title'] = encodeing(trim($tit[1]));
        $arr['description'] = encodeing(trim($dec[1][0]));
        $arr['content'] = encodeing(trim($con[1][0]));
        $arr['content'] = replacePicUrl($arr['content'], $host['scheme'] . '://' . $host['host']);
//        dump($arr);die;
        return $arr;
    }

    /**
     * 格式化数据库配置
     * @param $data     站点数据库信息
     * @return array
     */
    private function GetDbConfig($data){
        $config = [
            'type'=>'mysql',
            'hostname'=>$data['sql_ip'],
            'username'=>$data['sql_user'],
            'password'=>$data['sql_pass'],
            'database'=>$data['sql_database'],
        ];
        return $config;
    }

    /**
     * 格式化入库数据
     * @param $data         待格式化数组
     */
    private function FormatData($data){
        $data['siteid']=1;
        $data['mainid']=-1;
        $data['mainpid']=-1;
        $data['author']='admin';
        $data['hits']=rand(100,1000);
        $data['posttime']=time();
        $data['checkinfo'] = 'false';

        return $data;
    }


    /**
     * 获取入库的其他数据
     */
    private function GetOtherData(){
        //查询classid相关
        $res=$this->site_db->table('cc_infoclass')->field('id,parentid,parentstr')->where('id',$this->classid)->find();
        //查询文章最大排序
        $tmp=$this->site_db->table($this->tables)->field('max(orderid) as max_orderid')->find();

        $res['max_orderid']=$tmp['max_orderid'];

        return $res;
    }

}