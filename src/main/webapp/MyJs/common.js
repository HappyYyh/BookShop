//显示模态框
function showModal(){
    $('#modal').addClass('show')
}

//关闭模态框
function hideModal() {
    $("#modal").removeClass('show');
}

//管理员登陆
function Manager_login() {
    $("#show").html("");
    var username = $("#manager_username").val();
    var password = $("#manager_password").val();
    var url = "/Manager/login";
    var show = "";
    $.getJSON(url,{username:username,password:password},function (result) {
        if(result.status==3){//登陆成功
            window.open("admin/main.jsp");
            //location.href = "admin/main.jsp";
        }else {
            //登陆失败
            show +=result.msg;
            $("#show").append(show);
        }
    })
}

//时间戳转换yyyy-mm-dd
function fmtDate(obj){
    var date =  new Date(obj);
    var y = 1900+date.getYear();
    var m = "0"+(date.getMonth()+1);
    var d = "0"+date.getDate();
    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
}

//用户信息修改
function beforeUpdate() {
    $("#User-Update-Modal").modal('show');
    $.getJSON("/User/beforeUpdate",function (result) {
        $("#userID").val(result.id);
        $("#username").val(result.username);
        $("#email").val(result.email);
        $("#realname").val(result.realname);
        if(null!=result.birthday){
            $("#birthday").val(fmtDate(result.birthday));
        }
        $("input[name=sex]").val([result.sex]);
        $("#address").val(result.address);
        $("#postcode").val(result.postcode);
        $("#phone").val(result.phone);
    })
}
//修改
$("#upd-btn").click(function () {
    $("#upd-form").submit();
})

function cartAdd() {
    $("#cartAdd_form").submit();
}

function BooktoCart(id) {
    $("#form_"+id).submit();
}

var flag = true;
//大类查询
function QueryBigCategory() {
    if(flag){
        $.ajax({
            type:'get',
            url:'Category/Big',
            success:function (result) {
                $.each(result,function (index,item) {
                    var option =$("<option value='"+item.bname+"'>"+item.bname+"</option>").attr("bid",item.id);
                    $("#bigCategory").append(option);
                });

                flag = false;
            }
        })
    }
}

function QuerySmallCategory() {
    var bid = $("#bigCategory option:selected").attr("bid");
    $.ajax({
        type:'get',
        data:{bid:bid},
        url:'/Category/Small',
        success:function (result) {
            $("#smallCategory").empty();
            var show = '';
            $.each(result,function (index,item) {
                show+="<option value='"+item.sname+"'>"+item.sname+"</option>"
            })
            $("#smallCategory").append("<option value=''>请选择小类</option>");
            $("#smallCategory").append(show);
        }
    })
}