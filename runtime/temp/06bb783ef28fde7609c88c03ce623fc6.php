<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:77:"/Applications/MAMP/htdocs/spider_admin/application/admin/view/site/index.html";i:1531210309;s:73:"/Applications/MAMP/htdocs/spider_admin/application/admin/view/layout.html";i:1531194763;}*/ ?>
<!DOCTYPE html>
<html lang="zh_CN">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>后台管理</title>

        <meta name="description" content="overview &amp; stats" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

        <!-- page specific plugin styles -->

        <!-- text fonts -->
        <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/css/fonts.googleapis.com.css" />

        <!-- ace styles -->
        <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

        <!--[if lte IE 9]>
                <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
        <![endif]-->
        <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/css/ace-rtl.min.css" />

        <!--[if lte IE 9]>
          <link rel="stylesheet" href="<?php echo config('public.static'); ?>/ace1.4/assets/css/ace-ie.min.css" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->
        <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/ace-extra.min.js"></script>

        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
        <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/html5shiv.min.js"></script>
        <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/respond.min.js"></script>
        <![endif]-->
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    </head>

    <body class="no-skin">
        <div id="navbar" class="navbar navbar-default          ace-save-state">
            <div class="navbar-container ace-save-state" id="navbar-container">
                <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
                    <span class="sr-only">Toggle sidebar</span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>
                </button>

                <div class="navbar-header pull-left">
                    <a href="<?php echo url('index/index'); ?>" class="navbar-brand">
                        <small>
                            <i class="fa fa-ra"></i>
                            后台管理
                        </small>
                    </a>
                </div>

                <div class="navbar-buttons navbar-header pull-right" role="navigation">
                    <ul class="nav ace-nav">
                   

                        <li class="light-blue dropdown-modal">
                            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                <img class="nav-user-photo" src="<?php echo config('public.static'); ?>/ace1.4/assets/images/avatars/user.jpg" alt="Jason's Photo" />
                                <span class="user-info">
                                    <small>Welcome,</small>
                                    <?php echo session('user_name'); ?>
                                </span>
                                <i class="ace-icon fa fa-caret-down"></i>
                            </a>

                            <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                <li>
                                    <a href="<?php echo url('admin/public_edit_info'); ?>">
                                        <i class="ace-icon fa fa-user"></i>
                                        个人设置
                                    </a>
                                </li>

                                <li class="divider"></li>
                                <li>
                                    <a href="<?php echo url('login/logout'); ?>">
                                        <i class="ace-icon fa fa-power-off"></i>
                                        退出
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div><!-- /.navbar-container -->
        </div>

        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
            </script>

            <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
                <script type="text/javascript">
                    try {
                        ace.settings.loadState('sidebar')
                    } catch (e) {
                    }
                </script>

               


                <?php echo action('Menu/index','','widget'); ?>

                <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
                    <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
                </div>
            </div>

            <div class="main-content">
                <div class="main-content-inner">
                    <div class="page-content">
    <div class="col-sm-6 pull-right">
        <span class="btn btn-sm btn-primary pull-right" onclick="javascript:window.location.href = 'info'">
            添加
            <i class="icon-reply icon-only"></i>
        </span>
    </div>
    <div class="page-header">
        <h1>
            <?php echo model('menu')->getName(); if(\think\Request::instance()->get('group_id') > '0'): ?> [<?php echo model('AdminGroup')->getGroupName(\think\Request::instance()->get('group_id')); ?>]<?php endif; ?>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
                <div class="col-xs-12">
                    <table id="simple-table" class="table  table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" />
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th class="detail-col">序号</th>
                                <th>站点名称</th>
                                <th>站点链接</th>
                                <th class="hidden-480">提示</th>
                                <th class="hidden-480">数据库ip</th>
                                <th class="hidden-480">数据库用户名</th>
                                <th class="hidden-480">数据库密码</th>
                                <th class="hidden-480">数据库表名</th>
                                <th class="hidden-480">入库表</th>
                                <th>
                                    <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
                                    修改时间
                                </th>
                                <th>管理员操作</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php if(is_array($lists) || $lists instanceof \think\Collection || $lists instanceof \think\Paginator): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" />
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td><?php echo $vo['id']; ?></td>
                                <td><a href='<?php echo url("spider/info","id=$vo[id]"); ?>' target="_blank"><?php echo $vo['name']; ?></a></td>
                                <td><a href="<?php echo $vo['link']; ?>" target="_blank"><?php echo $vo['link']; ?></a></td>
                                <td class="hidden-480"><?php echo $vo['tip']; ?></td>
                                <td class="hidden-480"><?php echo $vo['sql_ip']; ?></td>
                                <td class="hidden-480"><?php echo $vo['sql_user']; ?></td>
                                <td class="hidden-480"><?php echo $vo['sql_pass']; ?></td>
                                <td class="hidden-480"><?php echo $vo['sql_database']; ?></td>
                                <td class="hidden-480"><?php echo $vo['sql_table']; ?></td>
                                <td><?php echo date('Y-m-d H:i:s',$vo['updatetime']); ?></td>
                                <td>
                                    <?php if($vo['id'] != '0'): ?>
                                    <div class="hidden-sm hidden-xs btn-group">

                                        <a href='<?php echo url("info","id=$vo[id]"); ?>'>
                                           <span class="btn btn-xs btn-info">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </span>
                                        </a>
                                        <a href='javascript:void(0)' onclick="return alert_del('<?php echo url("del","id=$vo[id]"); ?>', '确认要删除『 id=<?php echo $vo['id']; ?> 』这条记录吗？');">
                                           <span class="btn btn-xs btn-danger">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </span>
                                        </a>
                                    </div>
                                    <?php endif; ?>
                                </td>
                                
                            </tr>
                            <?php endforeach; endif; else: echo "" ;endif; ?>    
                        </tbody>
                    </table>
                   
                </div><!-- /.span -->
            </div><!-- /.row -->
            <?php echo $page; ?>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->




                </div>
            </div><!-- /.main-content -->

            <div class="footer">
                <div class="footer-inner">
                    <div class="footer-content">
                        <span class="bigger-120">
                            <span class="blue bolder"><a href="https://github.com/duzhenxun/TP5Admin" target="_blank">TP5Admin</a></span>
                             &copy; 2016-2018
                        </span>

                        &nbsp; &nbsp;
                        <span class="action-buttons">
                            <a href="#">
                                <i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
                            </a>

                            <a href="#">
                                <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
                            </a>

                            <a href="#">
                                <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                            </a>
                        </span>
                    </div>
                </div>
            </div>

            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div><!-- /.main-container -->

        <!-- basic scripts -->

        <!--[if !IE]> -->
        <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/jquery-2.1.4.min.js"></script>

        <!-- <![endif]-->

        <!--[if IE]>
<script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
        <script type="text/javascript">
                    if ('ontouchstart' in document.documentElement)
                        document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/bootstrap.min.js"></script>

        <!-- page specific plugin scripts -->

        <!--[if lte IE 8]>
          <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/excanvas.min.js"></script>
        <![endif]-->
    

        <!-- ace scripts -->
        <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/ace-elements.min.js"></script>
        <script src="<?php echo config('public.static'); ?>/ace1.4/assets/js/ace.min.js"></script>

        <!-- inline scripts related to this page -->
        <link rel="stylesheet" href="<?php echo config('public.static'); ?>/artDialog/dialog.css" />
        <script src="<?php echo config('public.static'); ?>/artDialog/dialog.js"></script>
        <!--artDialog end-->
        
        
        <script>
                    var u = $(".active").parent('ul');
                    
                    var uc = u.attr("class");//
                   
                    if (uc == 'submenu') {
                       u.parent().attr("class", "open active");
                       if(u.parent().parent().attr('class')=='submenu'){
                           u.parent().parent().parent().attr("class","open active");
                       }
                    }

                    //弹出图片
                    function alert_img(url, width, heigth, title) {

                        art.dialog({
                            padding: 0,
                            title: title,
                            content: '<img src="' + url + '" width="' + width + '" height="' + heigth + '" />',
                            lock: true
                        });
                    }
                    //弹出确认操作
                    function alert_del(url, title) {
                        art.dialog({
                            lock: true,
                            background: '#300', // 背景色
                            opacity: 0.87, // 透明度
                            content: title,
                            ok: function () {
                                return window.location.href = url;
                            },
                            cancel: true
                        });
                    }
        </script>
    </body>
</html>
