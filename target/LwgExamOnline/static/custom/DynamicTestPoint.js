//通过课程id，ajax请求返回对应的第一层考点
function courseOnclick()
{
    var courseId = $("input:radio[name='course.courseId']:checked").val();
    $.ajax({
        url:ctx+"/question/qryFirstTestPointByCourse.action",
        type:"post",
        dataType:"json",
        data:{
            courseId:courseId
        },
        success:function (data) {
            //在此处还需要对考点是否包含下一层考点进行判断
            var html ="";
            if(data.length>0){
                html += "<label><span style=\"color:red\">*</span>考点：</label>";
                for(dataList in data)
                {
                    html += "<input type='checkbox' name='firstTestPoint' onclick='firstTestPointOnclick()' value='"+ data[dataList].firstTestPoint + " '>"+data[dataList].firstTestPoint;
                }
            }
            $("#testPointDiv").html("");
            $("#secondTestPointDiv").html("");
            $("#thirdTestPointDiv").html("");
            $("#testPointDiv").html(html);
        }
    });
}
//通过第一层考点，ajax交互拿到第二层考点
function firstTestPointOnclick() {
    var firstTestPoint = "";
    $("input:checkbox[name='firstTestPoint']:checked").each(function () {
        firstTestPoint += $(this).val() + ",";
    });
    var id = firstTestPoint.substring(firstTestPoint.length -1, firstTestPoint.length);
    if(id == ","){
        firstTestPoint = firstTestPoint.substring(0, firstTestPoint.length-1);
    }
    //无论是拿到多少个都传输回去，自带，作为分隔符
    $.ajax({
        url:ctx+"/question/qrySecondTestPointByFirst.action",
        type:"post",
        dataType:"json",
        data:{
            firstTestPoint:firstTestPoint
        },
        success:function (data) {
            //由于我每次获取的都是checked被选中的值，那肯定是返回这些考点下的二次考点，先清空，在列出
            var html = "";
            if(data.length>0){
                html += "<label><span style=\"color:red\">*</span>细分考点：</label>";
                for(dataList in data)
                {
                    html += "<input type='checkbox' name='secondTestPoint' id='secondTestPoint' onclick='secondTestPointOnclick()' value='"+ data[dataList].secondTestPoint + " '>"+data[dataList].secondTestPoint;
                }
            }
            $("#secondTestPointDiv").html("");
            $("#secondTestPointDiv").html(html);
        }
    })
}

/*
ajax交互拿到第三层考点
 */
function secondTestPointOnclick()
{
    var secondTestPoint = "";
    $("input:checkbox[name='secondTestPoint']:checked").each(function () {
        secondTestPoint += $(this).val() + ",";
    });
    var id = secondTestPoint.substring(secondTestPoint.length -1, secondTestPoint.length);
    if(id == ","){
        secondTestPoint = secondTestPoint.substring(0, secondTestPoint.length-1);
    }
    //无论是拿到多少个都传输回去，自带，作为分隔符
    $.ajax({
        url:ctx+"/question/qryThirdTestPointBySecond.action",
        type:"post",
        dataType:"json",
        data:{
            secondTestPoint:secondTestPoint
        },
        success:function (data) {
            //由于我每次获取的都是checked被选中的值，那肯定是返回这些考点下的二次考点，先清空，在列出
            var html = "";
            if(data.length>0){
                html += "<label><span style=\"color:red\">*</span>更细分考点：</label>";
                for(dataList in data)
                {
                    html += "<input type='checkbox' name='thirdTestPoint' id='thirdTestPoint' value='"+ data[dataList].thirdTestPoint + " '>"+data[dataList].thirdTestPoint;
                }
            }
            $("#thirdTestPointDiv").html("");
            $("#thirdTestPointDiv").html(html);
        }
    })
}