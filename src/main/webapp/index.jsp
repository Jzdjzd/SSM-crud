<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/8 0008
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理-BootCRM</title>
<% pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!--不以/开始的相对路径，找资源以当前路径的资源为基准，经常容易出问题
以/开始的相对路径，找资源，以服务器的路径为基准（http：//localhost：3306），需要加上项目名
 http://localhost：3306/crud-%>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
    <title>顾客列表</title>
</head>
<body>
<!-- 客户列表查询部分  start-->

<!-- 添加员工模态框-->
<div class="modal fade" id="customerAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加客户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="cust_name_add" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="custName" id="cust_name_add"
                                   placeholder="输入客户姓名">
                            <span class="help-block"> </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">信息来源</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="custSource" id="cust_source_add">


                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cust_industry_add" class="col-sm-2 control-label">工作种类</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="custIndustry" id="cust_industry_add">


                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cust_level_add" class="col-sm-2 control-label">客户级别</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="custLevel" id="cust_level_add">


                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cust_phone_add" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="custPhone" id="cust_phone_add">
                            <span id="helpBlock2" class="help-block"> </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cust_tel_add" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="custMobile" id="cust_tel_add">
                            <span id="helpBlock2" class="help-block"> </span>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="cust_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--显示页面--%>
<div class="container">
    <%--标题行--%>
    <div class="row">
        <div class="col-md-12">
            <h1>JZD客户管理</h1>
        </div>
    </div>
        <div id="page-wrapper">
<%--员工搜索栏--%>
            <!-- /.row -->
            <div class="panel panel-default" id="custSel">
                <div class="panel-body">
                    <form class="form-inline" method="get"
                    >
                        <div class="form-group">
                            <label >客户名称</label>
                            <input type="text" class="form-control" id="cust_name_select"
                                   value="${custName }" name="custName" />
                        </div>
                        <div class="form-group">
                            <label>客户来源</label>
                            <select	class="form-control" id="cust_source_select" name="custSource">
                                <option value="">--请选择--</option>


                            </select>
                        </div>
                        <div class="form-group">
                            <label >所属行业</label>
                            <select	class="form-control" id="cust_industry_select"  name="custIndustry">
                                <option value="">--请选择--</option>

                            </select>
                        </div>
                        <div class="form-group">
                            <label >客户级别</label>
                            <select	class="form-control" id="cust_level_select" name="custLevel">
                                <option value="">--请选择--</option>

                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary" id="cust_selectBy">查询</button>
                    </form>
                </div>
            </div>
            <%--员工编辑模态框--%>
            <div class="modal fade" id="customerUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title">修改信息</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="cust_name_add" class="col-sm-2 control-label">名字</label>
                                    <div class="col-sm-5">
                                        <p class="form-control-static" id="cust_name_static"></p>
                                        <span class="help-block"> </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">信息来源</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" name="custSource" id="cust_source_update">


                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">工作种类</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" name="custIndustry" id="cust_industry_update">


                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">客户级别</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" name="custLevel" id="cust_level_update">


                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">手机</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" name="custPhone" id="cust_phone_update">
                                        <span id="helpBlock2" class="help-block"> </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电话</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" name="custMobile" id="cust_tel_update">
                                        <span id="helpBlock2" class="help-block"> </span>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="cust_update_btn">更新</button>
                        </div>
                    </div>
                </div>
            </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-3 col-md-offset-9">

            <button type="button" class="btn btn-primary" id="cust_add">新建</button>

            <button type="button" class="btn btn-danger" id="cust_del">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-striped" id="cust_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>ID</th>
                    <th>名字</th>
                    <th>信息来源</th>
                    <th>工作种类</th>
                    <th>客户级别</th>
                    <th>手机</th>
                    <th>电话</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>


                </tbody>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--分页--%>
        <div class="col-md-6" id="page_bulid">

        </div>
    </div>
</div>
<script type="text/javascript">
    <%--设置总记录数--%>
    var totalRecord, currentPage;
    <%--页面加载完成后 直接发送ajax请求 获得分页数据 --%>
    $(function () {
        to_page(1)
    });

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/customerJson",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                // console.log(result)
                //    1.解析显示员工数据
                bulidCustTable(result);
                //    2.解析显示分页数据
                bulid_page_info(result);
                //3分页条
                bulidPage(result);
                bulidSelect(result);
            }
        });

    }

    function bulidCustTable(result) {
        // 每次先清空
        $("#cust_table tbody").empty();
        var customers = result.extend.pageInfo.list;
        $.each(customers, function (index, item) {
            var checkBox=$("<td><input type='checkbox' class='check_item'/></td>");
            var custId = $("<td></td>").append(item.custId);
            var custName = $("<td></td>").append(item.custName);
            var custSource = $("<td></td>").append(item.custSource);
            var custIndustry = $("<td></td>").append(item.custIndustry);
            var custLevel = $("<td></td>").append(item.custLevel);
            var custPhone = $("<td></td>").append(item.custPhone);
            var custMobile = $("<td></td>").append(item.custMobile);

            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为当前按钮添加一个自定义的属性 来表示员工id
            editBtn.attr("edit-id", item.custId);
            var deleteBtn = $("<button></button>").addClass("btn btn-warning btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash ")).append("删除");
            deleteBtn.attr("delete-id",item.custId);
            var btn = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            //appen方法执行后返回原来的元素
            $("<tr></tr>").append(checkBox)
                .append(custId).append(custName).append(custSource).append(custIndustry).append(custLevel).append(custPhone)
                .append(custMobile).append(btn)
                .appendTo("#cust_table tbody");

        })
    }

    //解析显示分页信息
    function bulid_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页，总页数" + result.extend.pageInfo.pages + ", 总记录数" +
            result.extend.pageInfo.total)
        totalRecord = result.extend.pageInfo.total
        currentPage = result.extend.pageInfo.pageNum
    }

    //解析显示分页条
    function bulidPage(result) {
        $("#page_bulid").empty();
        var ul = $("<ul></ul>").addClass("pagination")
        //构建元素
        var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"))
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            // firstPage.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            //添加点击翻页的事件
            firstPage.click(function () {
                to_page(1);
            })
            prePage.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1)
            })
        }


        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPage = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        } else {
            nextPage.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            })
            lastPage.click(function () {
                to_page(result.extend.pageInfo.pages)
            })
        }

        //添加首页和前一页的提示
        ul.append(firstPage).append(prePage);
        //1 2 3 4 5 6 7
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var num = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                num.addClass("active")
            }
            num.click(function () {
                to_page(item)
            });
            ul.append(num);
        });
        //    添加下一页和尾页
        ul.append(nextPage).append(lastPage);
        //把ul加入到nav元素中
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_bulid")
    }

    //清空表单样式及内容
    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");


    }

    //点击新建按钮 弹出模拟框
    $("#cust_add").click(function () {
        //清除表单
        reset_form("#customerAdd form");
        // $("#customerAdd form")[0].reset();
        //发送ajax请求
        //显示部门列表
        getDepts("#cust_source_add");
        getDeptsIdu("#cust_industry_add");
        getDeptsLev("#cust_level_add");
        //弹出模态框
        $("#customerAdd").modal({
            backdrop: "static"
        })

    })

    //搜索栏
    function bulidSelect(result) {
        getDepts("#cust_source_select")
        getDeptsIdu("#cust_industry_select")
        getDeptsLev("#cust_level_select")

    }



    //查出所有部门信息

    function getDepts(ele) {
        $(ele).empty("");
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "get",
            success: function (result) {
                // console.log(result)
                $.each(result.extend.depts, function () {
                    if (this.dictTypeName == "客户信息来源") {
                        var opt = $("<option></option>").append(this.dictItemName).attr("value", this.dictId)
                        opt.appendTo(ele)
                    }

                })

            }

        })

    }

    function getDeptsIdu(ele) {
        $(ele).empty("");
        $.ajax({
            url: "${APP_PATH}/depts",

            type: "get",
            success: function (result) {
                // console.log(result)
                $.each(result.extend.depts, function () {
                    if (this.dictTypeName == "客户行业") {
                        var opt = $("<option></option>").append(this.dictItemName).attr("value", this.dictId)
                        opt.appendTo(ele)
                    }

                })

            }

        })

    }

    function getSelectUp() {
        // $(ele).empty("");
        // reset_form("#customerUpdate form");
        $("#cust_source_update").empty("");
         $("#cust_industry_update").empty("");
        $("#cust_level_update").empty("");
        $.ajax({
            async:false,
            url: "${APP_PATH}/depts",
            type: "get",
            success: function (result) {
                // console.log(result)
                $.each(result.extend.depts, function () {
                    if (this.dictTypeName == "客户信息来源") {
                        var opt = $("<option></option>").append(this.dictItemName).attr("value", this.dictId)
                        opt.appendTo("#cust_source_update")
                    }
                    if (this.dictTypeCode == 001) {
                        var opt = $("<option></option>").append(this.dictItemName).attr("value", this.dictId)
                        opt.appendTo("#cust_industry_update")
                    }
                    if (this.dictTypeCode == 006) {
                        var opt = $("<option></option>").append(this.dictItemName).attr("value", this.dictId)
                        opt.appendTo("#cust_level_update")
                    }

                })

            }

        })

    }
    function getDeptsLev(ele) {
        $(ele).empty("");
        $.ajax({
            url: "${APP_PATH}/depts",

            type: "get",
            success: function (result) {
                // console.log(result)
                $.each(result.extend.depts, function () {
                    if (this.dictTypeCode == 006) {
                        var opt = $("<option></option>").append(this.dictItemName).attr("value", this.dictId)
                        opt.appendTo(ele)
                    }

                })

            }

        })

    }

    //校验数据
    function validate_save() {
        //    拿到要检验的数据，使用正则表达式
        var custName = $("#cust_name_add").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|([\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(custName)) {
            validate_show_msg("#cust_name_add", "error", "请输入正确的格式");

            return false;
        } else {
            //清空元素之前的样式
            validate_show_msg("#cust_name_add", "success")

        }
        return true;
    }

    //    显示检验
    function validate_show_msg(ele, status, msg) {
        //清除当前元素的检验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text(" ");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);

        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }

    }

    //用户名是否可用
    $("#cust_name_add").change(function () {
        //    发送ajax请求检验 用户名是否可用
        var custName = this.value;
        $.ajax({

            url: "${APP_PATH}/checkuser",
            data: "custName=" + custName,
            type: "POST",
            success: function (result) {
                if (result.code == 1) {
                    validate_show_msg("#cust_name_add", "success", "用户名可用");
                    $("#cust_save_btn").attr("ajax-va", "success")
                } else {
                    validate_show_msg("#cust_name_add", "error", result.extend.VA_msg)
                    $("#cust_save_btn").attr("ajax-va", "error")
                }

            }

        });


    });
    //    添加员工
    $("#cust_save_btn").click(function () {
        //先对提交的数据进行校验
        if (!validate_save()) {
            return false;
        }
        ;
        //判断之前ajax校验是否成功
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/custSave",
            type: "POST",
            data: $("#customerAdd form").serialize(),
            success: function (result) {
                //员工保存成功
                if (result.code == 1) {
                    //1  关闭模拟框
                    $("#customerAdd").modal("hide");
                    //2  来到最后一页，显示保存的值
                    to_page(totalRecord);
                    // alert(result.msg);
                    // alert($("#customerAdd form").serialize());
                } else {
                    //    显示失败信息
                    //     console.log(result)
                    //     alert(result.extend.errorFields.custName)
                    if (undefined != result.extend.errorFields.custName) {
                        //    显示员工名字的错误信息
                        validate_show_msg("#cust_name_add", "error", result.extend.errorFields.custName)
                    }
                }

            }
        })
    })

    //    使用on方法 绑定标记按钮 click加载前执行 无法使用
    $(document).on("click", ".edit_btn", function () {
        //    查出所有信息
        //
        getSelectUp()
        getCust($(this).attr("edit-id"));




        //把员工id传递给模态框的更新按钮
        $("#cust_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#customerUpdate").modal({
            backdrop: "static"
        })
    })

    function getCust(id) {
        $.ajax({
            async:false,
            url: "${APP_PATH}/cust/" + id,
            type: "GET",
            success: function (result) {
                // console.log(result)
                var custData = result.extend.cust;
                $("#cust_name_static").text(custData.custName)
                $("#cust_phone_update").val(custData.custPhone)
                $("#cust_tel_update").val(custData.custMobile)
                $("#cust_source_update").val(custData.custSource)
                $("#cust_industry_update").val(custData.custIndustry)
                $("#cust_level_update").val(custData.custLevel)

            }
        })

    }


    //    点击更新更新员工信息
    $("#cust_update_btn").click(function () {
        $.ajax({
            url: "${APP_PATH}/cust/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#customerUpdate form").serialize(),
            success: function (result) {
                alert(result)
                // alert(result.msg);
                $("#customerUpdate").modal("hide");
                to_page(currentPage)
            }
        })

    })
    //点击单个删除
    $(document).on("click", ".delete_btn", function () {
        //弹出是否确定删除对话框
        var custName=$(this).parents("tr").find("td:eq(1)").text();
        var custId=$(this).attr("delete-id")
      if (confirm("确认删除【"+custName+"】吗？")){
          $.ajax({
              url:"${APP_PATH}/cust/"+ custId,
              type:"DELETE",
              success:function (result) {
                  alert(result.msg)
                  to_page(currentPage)
              }

          })
      }
    })
//    完成全选/全不选功能
    $("#check_all").click(function () {
        //attr 获取checked是undefined
        //我们这些dom原生的属性，attr获取自定义属性的值
        //prop修改和读取dom原生属性的值

        $(".check_item").prop("checked",$(this).prop("checked"))
    })
    $(document).on("click",".check_item",function () {
    //    判断选中的元素是否选满
        var flag=$(".check_item:checked").length==$(".check_item").length
        $("#check_all").prop("checked",flag)
    })
//    点击全部删除 就批量删除
    $("#cust_del").click(function () {
        var custNames=""
        var del_ids=""
        $.each($(".check_item:checked"),function () {
            custNames+=   $(this).parents("tr").find("td:eq(2)").text()+","
            del_ids+=   $(this).parents("tr").find("td:eq(1)").text()+"-"
        })
        //去除多余的“，”
        custNames= custNames.substring(0,custNames.length-1)
        del_ids =del_ids.substring(0,del_ids.length-1)
        //组装员工Id字符串
        if (confirm("确认删除【"+custNames+"】吗")) {
            $.ajax({
                url:"${APP_PATH}/cust/"+ del_ids,
                type:"DELETE",
                success:function (result) {

                    alert(result.msg)
                    to_page(currentPage)
                }

            })

        }
    })
    //搜索框逻辑
    $(document).on("click","#cust_selectBy",function () {
        var custLevel=$("#cust_level_select").val()
        $.ajax({
            url:"${APP_PATH}/customerJson1"+custLevel,
            type:"GET",

            success:function (result) {

                alert("成功")


            }
        })

    })

    // $(document).on("click","#cust_selectBy",function () {
    //     // bulidCustTable(result);
    //     // bulidPage(result);
    //     // bulid_page_info(result);
    //
    //     })
    //
    //     var p = $(this).children('#cust_level_select option:selected').text();//这就是selected的值
    //     if (p != "") {
    //         $("tbody>tr").hide().filter(":contains('" + p+ "')").show();
    //     } else {
    //         $("tbody>tr").show();
    //     }


</script>


</body>
</html>