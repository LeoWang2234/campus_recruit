/**
 * Created by cheng on 2017/9/19.
 */

function timeout() {

    alert("here");
    var myTime = setTimeout("Timeout()", 10000);

    function resetTime() {
        clearTimeout(myTime);
        myTime = setTimeout('Timeout()', 10000);
    }

    function Timeout() {
        alert("您的登录已超时, 请点确定后重新登录!");
        document.location.href = 'login.jsp';
    }

    document.documentElement.onkeydown = resetTime;
    document.documentElement.onclick = resetTime;
}

