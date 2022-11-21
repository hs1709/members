<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-11
  Time: 오후 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/jquery.js"></script>
<html>
<head>
    <title>memberSave.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container" id="save-form">
    <form action="/member/save" method="post" name="saveForm">
        <input type="text" name="memberEmail" id="memberEmail" placeholder="이메일" class="form-control" onblur="emailDuplicateCheck()">
        <span id="email-input-check"></span>
        <span id="email-dup-check"></span>
        <input type="text" name="memberPassword" placeholder="비밀번호" class="form-control">
        <input type="text" name="memberName" placeholder="이름" class="form-control">
        <input type="text" name="memberMobile" placeholder="전화번호" class="form-control">
        <input type="button" value="회원가입" onclick="save()" class="btn btn-primary">
    </form>
</div>
</body>
<script>
    const emailDuplicateCheck = () => {
        const email = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("email-dup-check");

        $.ajax({
            type: "post",
            url: "/duplicate-check",
            data: {inputEmail: email},
            dataType: "text",
            success: function (result) {
                if (result == "ok") {
                    checkResult.innerHTML = "사용할 수 있는 이메일입니다";
                    checkResult.style.color = "green";
                } else {
                    checkResult.innerHTML = "사용할 수 없는 이메일입니다";
                    checkResult.style.color = "red";
                }
            },
            error: function () {
                console.log("실패");
            }

        });
    }

    const save = () => {
        if (document.saveForm.memberEmail.value == ""){
            const emailCheck = document.getElementById("email-input-check");
            emailCheck.innerHTML = "이메일을 입력해주세요";
            emailCheck.style.color = "red";
            return false;
        } else if (document.saveForm.memberPassword.value == "") {
            alert("비밀번호를 입력해주세요");
            return false;
        } else if (document.saveForm.memberName.value == "") {
            alert("이름을 입력해주세요");
            return false;
        } else if (document.saveForm.memberMobile.value == "") {
            alert("전화번호를 입력해주세요");
            return false;
        }
        document.saveForm.submit();
    }
</script>
</html>
