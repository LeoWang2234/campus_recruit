/**
 * Created by cheng on 2017/9/16.
 */
//获取要修改的设备
function getEquipmentById(equipmentId) {

    if (!equipmentId) {
        alert('Error！');
        return false;
    }



    $
        .ajax({
            url: myContextPath+"/equipment/queryEquipmentById",
            data: {
                "equipmentId": equipmentId
            },
            type: "get",
            success: function (data) {
                $("#upName").val(data.name);
                $("#upProduceName").val(data.position);
                $("#upLink").val(data.link);
                $("#updDeadline").val(data.deadline);
                $("#upEquipmentId").val(data.id);
                $("#upBeizhu").val(data.push_code);
            },
            error: function () {
                alert("请求出错");
            },
        });
    return false;
}