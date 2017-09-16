/**
 * Created by cheng on 2017/9/17.
 */
//ÐÞ¸ÄÉè±¸
$("#updateForm")
    .submit(
        function (e) {
            var name = $.trim($("#upName").val());
            var position = $.trim($("#upProduceName").val());
            var link = $.trim($("#upLink").val());
            var upBeizhu = $.trim($("#upBeizhu").val());
            var deadline = $.trim($("#updDeadline").val());
            $
                .ajax({
                    url: myContextPath +"/equipment/updateEquipment",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify({
                        name: name,
                        position: position,
                        link: link,
                        id: $("#upEquipmentId").val(),
                        deadline: deadline,
                        push_code:upBeizhu
                    }),
                    success: function (data) {
                        if (data == true) {
                            alert("Update Succeed");
                            pagehtml($("#currentPage").val());
                        } else {
                            alert("You can only alter data added by you");
                        }

                    },
                    error: function () {
                        alert("Update Failed");
                    }

                });
            e.preventDefault();
        });