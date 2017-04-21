
//���ö�����ɱ༭  
function EditTables() {  
    for (var i = 0; i < arguments.length; i++) {  
        SetTableCanEdit(arguments[i]);  
    }  
}  
  
//���ñ���ǿɱ༭��  
function SetTableCanEdit(table) {  
    for (var i = 1; i < table.rows.length; i++) {  
        SetRowCanEdit(table.rows[i]);  
    }  
}  
  
function SetRowCanEdit(row) {  
    for (var j = 0; j < row.cells.length; j++) {  
  
        //�����ǰ��Ԫ��ָ���˱༭���ͣ����ʾ����༭  
        var editType = row.cells[j].getAttribute("EditType");  
        if (!editType) {  
            //�����ǰ��Ԫ��û��ָ������鿴��ǰ���Ƿ�ָ��  
            editType = row.parentNode.rows[0].cells[j].getAttribute("EditType");  
        }  
        if (editType) {  
            row.cells[j].onclick = function () {  
                EditCell(this);  
            }  
        }  
    }  
  
}  
  
//����ָ����Ԫ��ɱ༭  
function EditCell(element, editType) {  
  
    var editType = element.getAttribute("EditType");  
    if (!editType) {  
        //�����ǰ��Ԫ��û��ָ������鿴��ǰ���Ƿ�ָ��  
        editType = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("EditType");  
    }  
  
    switch (editType) {  
        case "TextBox":  
            CreateTextBox(element, element.innerHTML);  
            break;  
        case "DropDownList":  
            CreateDropDownList(element);  
            break;  
        default:  
            break;  
    }  
}  
  
//Ϊ��Ԫ�񴴽��ɱ༭�����  
function CreateTextBox(element, value) {  
    //���༭״̬������Ѿ��Ǳ༭״̬������  
    var editState = element.getAttribute("EditState");  
    if (editState != "true") {  
        //�����ı���  
        var textBox = document.createElement("INPUT");  
        textBox.type = "text";  
        textBox.className = "EditCell_TextBox";  
  
  
        //�����ı���ǰֵ  
        if (!value) {  
            value = element.getAttribute("Value");  
        }  
        textBox.value = value;  
  
        //�����ı����ʧȥ�����¼�  
        textBox.onblur = function () {  
            CancelEditCell(this.parentNode, this.value);  
        }  
        //��ǰ��Ԫ������ı���  
        ClearChild(element);  
        element.appendChild(textBox);  
        textBox.focus();  
        textBox.select();  
  
        //�ı�״̬����  
        element.setAttribute("EditState", "true");  
        element.parentNode.parentNode.setAttribute("CurrentRow", element.parentNode.rowIndex);  
    }  
}  
  
  
//Ϊ��Ԫ�񴴽�ѡ���  
function CreateDropDownList(element, value) {  
    //���༭״̬������Ѿ��Ǳ༭״̬������  
    var editState = element.getAttribute("EditState");  
    if (editState != "true") {  
        //�����½ӿ�  
        var downList = document.createElement("Select");  
        downList.className = "EditCell_DropDownList";  
  
        //����б���  
        var items = element.getAttribute("DataItems");  
        if (!items) {  
            items = element.parentNode.parentNode.rows[0].cells[element.cellIndex].getAttribute("DataItems");  
        }  
  
        if (items) {  
            items = eval("[" + items + "]");  
            for (var i = 0; i < items.length; i++) {  
                var oOption = document.createElement("OPTION");  
                oOption.text = items[i].text;  
                oOption.value = items[i].value;  
                downList.options.add(oOption);  
            }  
        }  
  
        //�����б�ǰֵ  
        if (!value) {  
            value = element.getAttribute("Value");  
        }  
        downList.value = value;  
  
        //���ô����½ӿ��ʧȥ�����¼�  
        downList.onblur = function () {  
            CancelEditCell(this.parentNode, this.value, this.options[this.selectedIndex].text);  
        }  
  
        //��ǰ��Ԫ����Ӵ����½ӿ�  
        ClearChild(element);  
        element.appendChild(downList);  
        downList.focus();  
  
        //��¼״̬�ĸı�  
        element.setAttribute("EditState", "true");  
        element.parentNode.parentNode.setAttribute("LastEditRow", element.parentNode.rowIndex);  
    }  
  
}  
  
  
//ȡ����Ԫ��༭״̬  
function CancelEditCell(element, value, text) {  
    element.setAttribute("Value", value);  
    if (text) {  
        element.innerHTML = text;  
    } else {  
        element.innerHTML = value;  
    }  
    element.setAttribute("EditState", "false");  
    
}  
  
//���ָ������������ֽڵ�  
function ClearChild(element) {  
    element.innerHTML = "";  
}  
  
//�����  
function AddRow(table, index) {  
    var lastRow = table.rows[table.rows.length - 1];  
    var newRow = lastRow.cloneNode(true);  
    table.tBodies[0].appendChild(newRow);  
    SetRowCanEdit(newRow);  
    return newRow;  
  
}  
  
  
//ɾ����  
function DeleteRow(table, index) {  
    for (var i = table.rows.length - 1; i > 0; i--) {  
        var chkOrder = table.rows[i].cells[0].firstChild;  
        if (chkOrder) {  
            if (chkOrder.type = "CHECKBOX") {  
                if (chkOrder.checked) {  
                    //ִ��ɾ��  
                    table.deleteRow(i);  
                }  
            }  
        }  
    }  
}  


//��ȡ����ֵ,JSON��ʽ  
function GetTableData(table) {  
    var tableData = new Array();  
    //alert("һ���е�������" + table.rows.length);  
    for (var i = 1; i < table.rows.length; i++) {  
        tableData.push(GetRowData(tabProduct.rows[i]));  
    }  
    alert("success");
    
    $.ajax({
        url:'advinfo/submit.do',
        data:{
            ds:JSON.stringify(tableData)  
           },
        type:'post',
        dataType:"json",
        success:function(json){
         $.messager.alert("��ʾ","�ɹ�","info");
        }
        
    });
   
  
}  
//��ȡָ���е����ݣ�JSON��ʽ  
function GetRowData(row) {  
    var rowData = {};  
    for (var j = 1; j < row.cells.length; j++) {  
        name = row.parentNode.rows[0].cells[j].getAttribute("Name");
        if (name) {   
           value = row.cells[j].innerHTML;  
           rowData[name] = value;  
        }  
    }    
    return rowData;  
  
}  
