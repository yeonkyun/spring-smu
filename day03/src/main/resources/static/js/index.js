let javascript_4 = {
    data: null,
    init: function () {
        $("#btn_getData").click(() => {
            this.getData();
        });
    },
    getData: function () {
        let datas = [{id: "id01", name: "홍길동", age: 10},
            {id: "id02", name: "홍길순", age: 20},
            {id: "id03", name: "홍길만", age: 30},
            {id: "id04", name: "홍길술", age: 40},
            {id: "id05", name: "홍길숙", age: 50}];
        this.display(datas);
    },
    display: function (datas) {
        let tbody = $("#table tbody");
        tbody.empty(); // Clear the table body
        $(datas).each(function (index, data) {
            let tr = $("<tr></tr>");
            let td0 = $("<td></td>").text(index + 1);
            let td1 = $("<td></td>").text(data.id);
            let td2 = $("<td></td>").text(data.name);
            let td3 = $("<td></td>").text(data.age);
            tr.append(td0);
            tr.append(td1);
            tr.append(td2);
            tr.append(td3);
            tbody.append(tr);
        });
    }
}

let javascript5 = {
    init: function () {
        $("#login_form > button").click(() => {
            // $("#btn_login").click(() => {
            this.check();
        })
    },
    check: function () {
        let id = $("#id").val();
        let pw = $("#pw").val();

        if (id === "") {
            alert("아이디를 입력해주세요.");
            $("#id").focus();
            return;
        } else if (pw === "") {
            alert("비밀번호를 입력해주세요.");
            $("#pw").focus();
            return;
        } else {
            this.send();
        }
    },
    send: function () {
        // method: "POST" 방식으로 전송
        // action: "/login" URL로 전송
        $("#login_form").attr("method", "POST");
        $("#login_form").attr("action", loginimpl);
        $("#login_form").submit();
    }
}

let chatbtn = {
    init: function () {
        const scrollBtn = document.createElement("button");
        scrollBtn.innerHTML = "chatbot";
        scrollBtn.setAttribute("id", "scroll-btn");
        document.body.appendChild(scrollBtn);
        scrollBtn.classList.add("show");
        scrollBtn.addEventListener("click", function () {
            location.href = '/chatbot';
        });

        const scrollBtn2 = document.createElement("button");
        scrollBtn2.innerHTML = "1:1";
        scrollBtn2.setAttribute("id", "scroll-btn2");
        document.body.appendChild(scrollBtn2);
        scrollBtn2.classList.add("show");
        scrollBtn2.addEventListener("click", function () {
            location.href = '/websocket';
        });
    }
};