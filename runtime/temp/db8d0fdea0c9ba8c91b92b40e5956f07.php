<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:78:"/Applications/MAMP/htdocs/spider_admin/application/admin/view/index/index.html";i:1500520928;s:73:"/Applications/MAMP/htdocs/spider_admin/application/admin/view/layout.html";i:1531194763;}*/ ?>
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

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="alert alert-block alert-success">
                <button type="button" class="close" data-dismiss="alert">
                    <i class="ace-icon fa fa-times"></i>
                </button>
                <i class="ace-icon fa fa-check green"></i>
                Welcome to
                <strong class="green">
                    TP5Admin
                    <small>(v1.2.0)</small>
                </strong>,
                欢迎使用本程序,技术咨询交流QQ:5552123(阿杜) <a href="https://github.com/duzhenxun/TP5Admin" target="_blank">github</a> .
            </div>

            <div class="row">
                <div class="space-6"></div>

                <div class="col-sm-7 infobox-container">
                    <div class="infobox infobox-green">
                        <div class="infobox-icon">
                            <i class="ace-icon fa fa-comments"></i>
                        </div>

                        <div class="infobox-data">
                            <span class="infobox-data-number">32</span>
                            <div class="infobox-content">comments + 2 reviews</div>
                        </div>

                        <div class="stat stat-success">8%</div>
                    </div>

                    <div class="infobox infobox-blue">
                        <div class="infobox-icon">
                            <i class="ace-icon fa fa-twitter"></i>
                        </div>

                        <div class="infobox-data">
                            <span class="infobox-data-number">11</span>
                            <div class="infobox-content">new followers</div>
                        </div>

                        <div class="badge badge-success">
                            +32%
                            <i class="ace-icon fa fa-arrow-up"></i>
                        </div>
                    </div>

                    <div class="infobox infobox-pink">
                        <div class="infobox-icon">
                            <i class="ace-icon fa fa-shopping-cart"></i>
                        </div>

                        <div class="infobox-data">
                            <span class="infobox-data-number">8</span>
                            <div class="infobox-content">new orders</div>
                        </div>
                        <div class="stat stat-important">4%</div>
                    </div>

                    <div class="infobox infobox-red">
                        <div class="infobox-icon">
                            <i class="ace-icon fa fa-flask"></i>
                        </div>

                        <div class="infobox-data">
                            <span class="infobox-data-number">7</span>
                            <div class="infobox-content">experiments</div>
                        </div>
                    </div>

                    <div class="infobox infobox-orange2">
                        <div class="infobox-chart">
                            <span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
                        </div>

                        <div class="infobox-data">
                            <span class="infobox-data-number">6,251</span>
                            <div class="infobox-content">pageviews</div>
                        </div>

                        <div class="badge badge-success">
                            7.2%
                            <i class="ace-icon fa fa-arrow-up"></i>
                        </div>
                    </div>

                    <div class="infobox infobox-blue2">
                        <div class="infobox-progress">
                            <div class="easy-pie-chart percentage" data-percent="42" data-size="46">
                                <span class="percent">42</span>%
                            </div>
                        </div>

                        <div class="infobox-data">
                            <span class="infobox-text">traffic used</span>

                            <div class="infobox-content">
                                <span class="bigger-110">~</span>
                                58GB remaining
                            </div>
                        </div>
                    </div>





                </div><!-- /.widget-box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
        <!-- PAGE CONTENT ENDS -->
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